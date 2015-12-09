use lib '../lib';

use SimpleTranslations;

use Plack::Builder;
use Plack::Handler::CGI;

my $app = builder {
    SimpleTranslations->to_app;
};

__END__