package MyData::Schema::ResultSet::User;

use base 'DBIx::Class::ResultSet';

sub _serialize {
#     my $resultset = shift;
#     my @rows;
#     while (my $row = $resultset->next) {
#         push @rows, {
#             href    => $row->uuid,
#             label   => '/users/'. $row->name
#         }
#     }
#     return \@rows;
    [ map +{href=>'/users/'.$_->uuid, label=>$_->name}, $_[0]->all ]
};

1;
