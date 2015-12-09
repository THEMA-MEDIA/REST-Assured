use lib '../lib';

use SimpleContentNegotiation;

use Plack::Builder;
use Plack::Handler::CGI;

my $app = builder {
    SimpleContentNegotiation->to_app;
};

__END__