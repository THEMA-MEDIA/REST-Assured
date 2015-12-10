use lib '../lib';

use MyData::Schema;

use UUID::Random;

my $schema = MyData::Schema
    ->connect('dbi:SQLite:dbname=../etc/MyData.sqlite', '', '');

$schema->deploy( { sources => [ 'User' ], add_drop_table => 1 } );

my $reultset = $schema->resultset('User')->populate([
    {   _primary_key    => 1,
        uuid            => UUID::Random::generate(),
        name            => 'John Doe',
        nick_name       => 'JD',
        email           => 'john.d@example.com'},
    {   _primary_key    => 2,
        uuid            => UUID::Random::generate(),
        name            => 'Mary Jane',
        nick_name       => 'MJ',
        email           => 'mary.j@example.com'},
]);

__END__
