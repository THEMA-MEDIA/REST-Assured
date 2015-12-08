package SimpleWebUsers;

use Dancer2;

use Dancer2::Plugin::DBIC;

get '/users' => sub {
    my $users;
    if (param 'name') {
        $users = resultset('User')
            ->search({name => {-like => '%' . param('name') . '%'} });
    } else {
        $users = resultset('User');
    };
    template 'users' => { users => $users };
};

get '/users/:uuid' => sub {
    my $user = resultset('User')->find( { uuid => params->{uuid} } );
    if ( !$user ) {
        status(404);
        forward('404')
    }
    template 'user_details' => { user => $user };
};

1;
