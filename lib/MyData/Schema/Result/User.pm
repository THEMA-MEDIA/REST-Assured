package MyData::Schema::Result::User;
use utf8;
use MyData::Schema::Candy;
__PACKAGE__->load_components( 'InflateColumn::DateTime', 'TimeStamp' );


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

column "last_updated" => {
    data_type           => 'datetime',
    is_nullable         => 1,
    set_on_create       => 1,
    set_on_update       => 1,
};

sub sqlt_deploy_hook {
    $_[1]->add_index(name => 'uuid_idx', fields => ['uuid'])
};

sub _serialize {
    return {
#       uuid => $_[0]->uuid,
        name => $_[0]->name,
        nick => $_[0]->nick_name,
        mail => $_[0]->email,
    };
};

=head1 COPYRIGHT

(c) 2014 - Th.J. van Hoesel - THEMA-MEDIA NL

=cut

1;
