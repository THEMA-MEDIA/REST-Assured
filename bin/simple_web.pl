use lib '../lib';

use SimpleWeb;

use Plack::Builder;
use Plack::Handler::CGI;

my $app = builder {
    SimpleWeb->to_app;
};

__END__