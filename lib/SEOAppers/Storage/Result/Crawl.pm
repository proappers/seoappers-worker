use utf8;

package SEOAppers::Storage::Result::Crawl;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

SEOAppers::Storage::Result::Crawl

=cut

use strict;
use warnings;

use Mojo::UserAgent;
use Mojo::IOLoop;
use Mojo::URL;

use 5.10.0;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<crawl>

=cut

__PACKAGE__->table("crawl");

=head1 ACCESSORS

=head2 crawl_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 date_started

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 date_created

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 date_finished

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 priority

  data_type: 'integer'
  is_nullable: 1

=head2 website_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "crawl_id",
    { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
    "date_started",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "date_created",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "date_finished",
    {
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "priority",
    { data_type => "integer", is_nullable => 1 },
    "website_id",
    { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</crawl_id>

=item * L</website_id>

=back

=cut

__PACKAGE__->set_primary_key( "crawl_id", "website_id" );

=head1 RELATIONS

=head2 pages

Type: has_many

Related object: L<SEOAppers::Storage::Result::Page>

=cut

__PACKAGE__->has_many(
    "pages",
    "SEOAppers::Storage::Result::Page",
    {
        "foreign.crawl_id"   => "self.crawl_id",
        "foreign.website_id" => "self.website_id",
    },
    { cascade_copy => 0, cascade_delete => 0 },
);

=head2 website

Type: belongs_to

Related object: L<SEOAppers::Storage::Result::Website>

=cut

__PACKAGE__->belongs_to( "website", "SEOAppers::Storage::Result::Website", { website_id => "website_id" }, { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" }, );

# Created by DBIx::Class::Schema::Loader v0.07025 @ 2012-08-23 23:37:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:W7LjsGzKuIB+H7HchxFiDQ

sub execute {

    my ($self) = @_;

    # Startzeit setzen
    $self->update( { date_started => \"UTC_TIMESTAMP()" } );

        my $base = Mojo::URL->new( $self->website->url );

    # FIFO queue
    my $seen = {};

    # User agent following up to 5 redirects
    my $ua = Mojo::UserAgent->new( max_redirects => 5 );

    my $end = $self->website->max_sites;

    my @urls = ( Mojo::URL->new( $self->website->url )->to_string );

    while ( my $url = shift @urls ) {

        if ( !exists $seen->{$url} ) {

            my $tx = $ua->get($url);
            
            $seen->{$url} = $tx->res->dom;

            # Extract URLs
            print "Searching in $url\n";

            $tx->res->dom('a[href]')->each(
                sub {

                    my $e = shift;

                    my $murl = Mojo::URL->new($url);

                    # Build absolute URL
                    my $surl = Mojo::URL->new( $e->{href} )->to_abs($murl);
                    print " -> $surl  \n";

                    my $surl_string = $surl->to_string;
                    my $murl_string = $murl->to_string;

                    if ( $surl->host eq $murl->host ) {

                        push @urls, $surl_string;
                    }

                }
            );



        }
    }

    foreach my $url ( keys %$seen ) {

        print " -> $url  \n";
 
        my $dom = $seen->{$url};

        my $page = $self->create_related('pages', { path => Mojo::URL->new($url)->to_rel($base) , seo_score => 42 });
    
        use Data::Printer;

        my $title            = $dom->at('title')->text;
        my $meta_description = $dom->at('meta[name=description]') ;
        my $meta_keywords    = $dom->at('meta[name=keywords]');

        $page->create_related('page_items', { page_item_key => "title", page_value => $title });
        $page->create_related('page_items', { page_item_key => "meta.description", page_value => $meta_description ? $meta_description->attrs->{content} : "" });
        $page->create_related('page_items', { page_item_key => "meta.keywords",    page_value => $meta_keywords    ? $meta_keywords->attrs->{content} : "" });
        
    
    
    }
 

    # Endzeit setzen
    $self->update( { date_finished => \"UTC_TIMESTAMP()" } );

}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
