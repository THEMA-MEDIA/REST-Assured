use lib '../lib';

use SimpleWebUsers;

use Plack::Builder;
use Plack::Handler::CGI;

my $app = builder {
    SimpleWebUsers->to_app;
};

__END__