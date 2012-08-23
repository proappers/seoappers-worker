package SEOAppers::Storage::ResultSet::Crawl;

use utf8;
use strict;
use warnings;

use base qw/DBIx::Class::ResultSet/;


sub queue {

    my ( $self ) = @_;
    return $self->search_rs( {  'date_started' => undef  } );
}


1;
