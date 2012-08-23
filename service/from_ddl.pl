# in a script
use DBIx::Class::Schema::Loader qw/ make_schema_at /;

make_schema_at(
    'SEOAppers::Storage',
    {
        debug          => 1,
        dump_directory => '../lib',
        db_schema      => 'seoappers',
        qualify_objects => 0,
        use_moose => 1,
        overwrite_modifications => 1,
    },
    [
        'dbi:mysql:server=localhost','seoappers', 'seoappers',
    ],
);


