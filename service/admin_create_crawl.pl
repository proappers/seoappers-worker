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


my $websites = $schema->resultset('Website')->search_rs;

while ( my $website = $websites->next ) {

    $website->create_related('crawls', { priority => 255 });
}


