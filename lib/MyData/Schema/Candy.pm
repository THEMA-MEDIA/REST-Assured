package MyData::Schema::Candy;

use base 'DBIx::Class::Candy';

sub base { $_[1] || 'MyData::Schema::Result' };

1;
