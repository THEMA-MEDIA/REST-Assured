package MyData::Schema::Result::User;
use utf8;
use MyData::Schema::Candy;

table "users";

primary_column "_primary_key" => {
    data_type           => 'integer',
    is_auto_increment   => 1,
};

column "uuid" => {
    data_type           => 'text',
};

column "name" => {
    data_type           => 'text',
};

column "nick_name" => {
    data_type           => 'text',
    is_nullable         => 1,
};

column "email" => {
    data_type           => 'text',
};

sub sqlt_deploy_hook {
    $_[1]->add_index(name => 'uuid_idx', fields => ['uuid'])
}
# primary_key "_primary_key";

=head1 COPYRIGHT

(c) 2014 - Th.J. van Hoesel - THEMA-MEDIA NL

=cut

1;
