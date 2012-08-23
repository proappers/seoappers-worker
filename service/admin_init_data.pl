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

my $website = $schema->resultset('Website')->create( { url => "http://www.mcei2020.de/", name => "Test", seo_score => 0, created => \"UTC_TIMESTAMP()", max_sites => 1000 });


