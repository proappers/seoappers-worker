use utf8;
package SEOAppers::Storage::Result::Website;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

SEOAppers::Storage::Result::Website

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<website>

=cut

__PACKAGE__->table("website");

=head1 ACCESSORS

=head2 website_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 url

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 state

  data_type: 'enum'
  extra: {list => ["active","deleted"]}
  is_nullable: 1

=head2 seo_score

  data_type: 'integer'
  is_nullable: 1

=head2 created

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 max_sites

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "website_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "url",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "state",
  {
    data_type => "enum",
    extra => { list => ["active", "deleted"] },
    is_nullable => 1,
  },
  "seo_score",
  { data_type => "integer", is_nullable => 1 },
  "created",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "max_sites",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</website_id>

=back

=cut

__PACKAGE__->set_primary_key("website_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<url_UNIQUE>

=over 4

=item * L</url>

=back

=cut

__PACKAGE__->add_unique_constraint("url_UNIQUE", ["url"]);

=head1 RELATIONS

=head2 crawls

Type: has_many

Related object: L<SEOAppers::Storage::Result::Crawl>

=cut

__PACKAGE__->has_many(
  "crawls",
  "SEOAppers::Storage::Result::Crawl",
  { "foreign.website_id" => "self.website_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2012-08-23 23:37:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+RJBDBfr0QDdnkevNMntAA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
