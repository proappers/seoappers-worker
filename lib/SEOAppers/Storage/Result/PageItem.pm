use utf8;
package SEOAppers::Storage::Result::PageItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

SEOAppers::Storage::Result::PageItem

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<page_item>

=cut

__PACKAGE__->table("page_item");

=head1 ACCESSORS

=head2 page_item_id

  data_type: 'integer'
  is_nullable: 0

=head2 page_item_key

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 page_value

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 page_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

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
  "page_item_id",
  { data_type => "integer", is_nullable => 0 },
  "page_item_key",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "page_value",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "page_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "crawl_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "website_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</page_item_id>

=item * L</page_id>

=item * L</crawl_id>

=item * L</website_id>

=back

=cut

__PACKAGE__->set_primary_key("page_item_id", "page_id", "crawl_id", "website_id");

=head1 RELATIONS

=head2 page

Type: belongs_to

Related object: L<SEOAppers::Storage::Result::Page>

=cut

__PACKAGE__->belongs_to(
  "page",
  "SEOAppers::Storage::Result::Page",
  {
    crawl_id   => "crawl_id",
    page_id    => "page_id",
    website_id => "website_id",
  },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2012-08-23 22:46:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Af3r82oRynRsv+PFDhntQA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
