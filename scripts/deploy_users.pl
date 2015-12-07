use MyData::Schema;

my $schema = MyData::Schema
    ->connect('dbi:SQLite:dbname=../etc/MyData.sqlite', '', '');

$schema->deploy( { sources => [ 'User' ], add_drop_table => 1 } );

$schema->resultset('User')->populate([
    {  user_id      => 1,
       first_name   => 'John',
       nick_name    => 'Doe',
       email        => "john@doe.com"},
    {  user_id      => 2,
       first_name   => 'Mary',
       nick_name    => 'Jane',
       email        => "mary@.com"},
]);

__END__
