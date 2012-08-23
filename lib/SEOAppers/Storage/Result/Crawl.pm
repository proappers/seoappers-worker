use utf8;
package SEOAppers::Storage::Result::Crawl;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

SEOAppers::Storage::Result::Crawl

=cut

use strict;
use warnings;

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
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "date_created",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "date_finished",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
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

__PACKAGE__->set_primary_key("crawl_id", "website_id");

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

__PACKAGE__->belongs_to(
  "website",
  "SEOAppers::Storage::Result::Website",
  { website_id => "website_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2012-08-23 23:37:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:W7LjsGzKuIB+H7HchxFiDQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
