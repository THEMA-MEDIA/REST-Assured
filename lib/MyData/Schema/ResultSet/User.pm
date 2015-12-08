package MyData::Schema::ResultSet::User;

use base 'DBIx::Class::ResultSet';

sub serialize {
    my $resultset = shift;
    my @rows;
    while (my $row = $resultset->next) {
        push @rows, {
            href    => $row->uuid,
            label   => '/users/'. $row->name
        }
    }
    return \@rows;
};

1;
