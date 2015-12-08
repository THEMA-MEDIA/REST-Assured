package SimpleAPIUsers;

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
    return [ map +{href=>'/users/'.$_->uuid, label=>$_->name}, $users->all ] ;
};

get '/users/:uuid' => sub {
    my $user = resultset('User')->find( { uuid => params->{uuid} } );
    if ( !$user ) {
        status(404);
        return;
    }    
    return {
        uuid        => $user->uuid,
        name        => $user->name,
        nick_name   => $user->nick_name,
        email       => $user->email,
    }
};

1;
