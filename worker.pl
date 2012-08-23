#!/usr/bin/env perl 

use strict;
use warnings;
use utf8;

use FindBin qw($Bin);
use lib "$Bin/lib";
use SEOAppers::Utils;
use DateTime;
binmode( STDOUT, ':utf8' );

my $schema = SEOAppers::Utils->schema;

# in den Hauptteil wechseln
while (1) {

    print "Suche nach … \n";

    # Die aktuelle Queue
    my $queue = $schema->resultset('Crawl')->queue;

    # Prüfen ob Jobs vorhanden
    if ( $queue->count > 0 ) {

        # nächsten Job
        my $crawl = $queue->first;

        # Job auf den Status "In Arbeit" setzen
        $crawl->update( { date_created => \"UTC_TIMESTAMP()" } );

        # Job ausführen
        $crawl->execute;

    } else {

        sleep(3);
    }
}


