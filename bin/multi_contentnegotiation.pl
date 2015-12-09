use lib '../lib';

use MultiContentNegotiation;

use Plack::Builder;
use Plack::Handler::CGI;

my $app = builder {
    MultiContentNegotiation->to_app;
};

__END__