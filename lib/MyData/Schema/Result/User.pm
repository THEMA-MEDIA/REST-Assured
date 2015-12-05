package MyData::Schema::Result::User;
use utf8;
use MyData::Schema::Candy;

table "users";

column "user_id" => {
    data_type          => 'integer',
    is_auto_increment  => 1,
};

column "first_name" => {
    data_type          => 'text',
};

column "nick_name" => {
    data_type          => 'text',
    is_nullable        => 1,
};

column "email" => {
    data_type          => 'text',
};

primary_key "user_id";

=head1 COPYRIGHT

(c) 2014 - Th.J. van Hoesel - THEMA-MEDIA NL

=cut

1;
