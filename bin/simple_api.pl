use lib '../lib';

use SimpleAPIUsers;

use Plack::Builder;
use Plack::Handler::CGI;

my $app = builder {
    SimpleAPIUsers->to_app;
};

__END__