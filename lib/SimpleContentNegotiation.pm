package SimpleContentNegotiation;

use Dancer2;
use Dancer2::Plugin::HTTP::ContentNegotiation;

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

get '/translations' => sub {
    http_choose_language(
        [ keys %$translations ] => sub {
            to_json $translations->{http_chosen_language()}
        },
        { default => 'en' }
    )
};

1;
