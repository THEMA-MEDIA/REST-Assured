package MultiContentNegotiation;

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
            my $translation = $translations->{http_chosen_language()};
            http_choose_media_type(
                'application/json'   => sub{ to_json $translation, {pretty=>1}},
                'text/x-yaml'        => sub{ to_yaml $translation},
                'text/x-data-dumper' => sub{ to_dumper $translation },
                { default => undef }
            )
        }, { default => 'en' } )
};

1;
