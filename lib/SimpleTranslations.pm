package SimpleTranslations;

use Dancer2;
use Dancer2::Plugin::Multilang;
use Dancer2::Plugin::REST;

prepare_serializer_for_format;

my $translations = {
    en => { morning     => "Good morning",
            afternoon   => "Good afternoon",
            evening     => "Good evening",
            night       => "Good night"        },
    nl => { morning     => "Goedemorgen",
            afternoon   => "Goedemiddag",
            evening     => "Goedeavond",
            night       => "Goedenacht"        },
};

get '/translations.:format' => sub {
    return { %{ $translations->{ language() } } };
};

1;
