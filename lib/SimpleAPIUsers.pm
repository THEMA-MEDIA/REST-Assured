package SimpleAPIUsers;

use Dancer2;
use Dancer2::Plugin::DBIC;
use Dancer2::Plugin::HTTP::ContentNegotiation;

get '/users' => sub {
    my $users;
    if (param 'name') {
        $users = resultset('User')
            ->search({name => {-like => '%' . param('name') . '%'} });
    } else {
        $users = resultset('User');
    };
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
    http_choose_media_type(
        'application/json'   => sub { to_json   $user->_serialize },
        'text/x-yaml'        => sub { to_yaml   $user->_serialize },
        'text/x-data-dumper' => sub { to_dumper $user->_serialize },
        { default => undef }
    );
};

1;
