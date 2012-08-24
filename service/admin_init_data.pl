#!/usr/bin/env perl 

use strict;
use warnings;
use utf8;

use FindBin qw($Bin);
use lib "$Bin/../lib";
use SEOAppers::Utils;
use DateTime;
binmode( STDOUT, ':utf8' );

my $schema = SEOAppers::Utils->schema;

$schema->resultset('Website')->delete_all;

my $website1 = $schema->resultset('Website')->create( { url => "http://www.mcei2020.de/", name => "mcei", seo_score => 0, created => \"UTC_TIMESTAMP()", max_sites => 100 });
my $website2 = $schema->resultset('Website')->create( { url => "http://www.schwarze-hand-hassloch.de/", name => "Hassloch", seo_score => 0, created => \"UTC_TIMESTAMP()", max_sites => 100 });



