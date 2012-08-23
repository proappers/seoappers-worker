use utf8;
package SEOAppers::Storage::Result::Page;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

SEOAppers::Storage::Result::Page

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<page>

=cut

__PACKAGE__->table("page");

=head1 ACCESSORS

=head2 page_id

  data_type: 'integer'
  is_nullable: 0

=head2 seo_score

  data_type: 'integer'
  is_nullable: 1

=head2 path

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 crawl_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 website_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "page_id",
  { data_type => "integer", is_nullable => 0 },
  "seo_score",
  { data_type => "integer", is_nullable => 1 },
  "path",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "crawl_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "website_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</page_id>

=item * L</crawl_id>

=item * L</website_id>

=back

=cut

__PACKAGE__->set_primary_key("page_id", "crawl_id", "website_id");

=head1 RELATIONS

=head2 crawl

Type: belongs_to

Related object: L<SEOAppers::Storage::Result::Crawl>

=cut

__PACKAGE__->belongs_to(
  "crawl",
  "SEOAppers::Storage::Result::Crawl",
  { crawl_id => "crawl_id", website_id => "website_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 page_items

Type: has_many

Related object: L<SEOAppers::Storage::Result::PageItem>

=cut

__PACKAGE__->has_many(
  "page_items",
  "SEOAppers::Storage::Result::PageItem",
  {
    "foreign.crawl_id"   => "self.crawl_id",
    "foreign.page_id"    => "self.page_id",
    "foreign.website_id" => "self.website_id",
  },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2012-08-23 22:46:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Yf1XFiUFwWeXNduKd39nMA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
