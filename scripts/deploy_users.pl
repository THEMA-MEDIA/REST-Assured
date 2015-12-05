use MyData::Schema;

my $schema = MyData::Schema
    ->connect('dbi:SQLite:dbname=../etc/MyData.sqlite', '', '');

$schema->deploy;

__END__
