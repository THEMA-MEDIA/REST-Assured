package SimpleAPIUsers;

use Dancer2;
use Dancer2::Plugin::DBIC;
use Dancer2::Plugin::HTTP::ContentNegotiation;
use Dancer2::Plugin::HTTP::Caching;
use Dancer2::Plugin::HTTP::ConditionalRequest;
use Dancer2::Plugin::HTTP::Auth::Extensible;
use Dancer2::Plugin::HTTP::Cache::Chi;
use DateTime::Format::HTTP;

get '/users' => sub {
    my $users;
    if (param 'name') {
        $users = resultset('User')
            ->search({name => {-like => '%' . param('name') . '%'} });
    } else {
        $users = resultset('User');
    };
    http_cache_max_age 300; # five minutes
    http_cache_public;
    http_choose_media_type(
        'application/json'   => sub { to_json   $users->_serialize },
        'text/x-yaml'        => sub { to_yaml   $users->_serialize },
        'text/x-data-dumper' => sub { to_dumper $users->_serialize },
        { default => undef }
    );
};

get '/users/:uuid' => sub {
    my $user = resultset('User')->find( { uuid => params->{uuid} } );
    if ( !$user ) {
        status(404);
        return;
    }
    http_cache_max_age 3600; # one hour
    http_cache_public;
    http_expire 'Sun, 13 Dec 2015 00:00:00 GMT';
    http_conditional {
        last_modified =>
            DateTime::Format::HTTP->format_datetime($user->last_updated)
    } => sub {
        http_choose_media_type(
            'application/json'   => sub { to_json   $user->_serialize },
            'text/x-yaml'        => sub { to_yaml   $user->_serialize },
            'text/x-data-dumper' => sub { to_dumper $user->_serialize },
            { default => undef }
        );
    };
};

put '/users/:uuid' => http_require_role 'admin' => sub {
    my $user = resultset('User')->find( { uuid => params->{uuid} } );
    if ( !$user ) {
        status(404);
        return;
    }
    http_conditional {
        last_modified =>
            DateTime::Format::HTTP->format_datetime($user->last_updated),
        required => true,
    } => sub {
        $user->update( from_json(request->body) );
        status(200);
        return;
    };
};

1;
