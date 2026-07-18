use utf8;
package ClaphamTechPress::Schema::Result::Book;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ClaphamTechPress::Schema::Result::Book

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<book>

=cut

__PACKAGE__->table("book");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 subtitle

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 slug

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 pubdate

  data_type: 'date'
  is_nullable: 0

=head2 blurb

  data_type: 'varchar'
  is_nullable: 0
  size: 1000

=head2 image

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=head2 amazon_asin

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 leanpub_slug

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 examples

  data_type: 'varchar'
  is_nullable: 1
  size: 30

=head2 author_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 is_perlschool_book

  data_type: 'boolean'
  default_value: 1
  is_nullable: 0

=head2 is_live

  data_type: 'boolean'
  default_value: 1
  is_nullable: 0

=head2 topic

  data_type: 'varchar'
  default_value: 'xxx'
  is_nullable: 0
  size: 20

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "subtitle",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "slug",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "pubdate",
  { data_type => "date", is_nullable => 0 },
  "blurb",
  { data_type => "varchar", is_nullable => 0, size => 1000 },
  "image",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "amazon_asin",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "leanpub_slug",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "examples",
  { data_type => "varchar", is_nullable => 1, size => 30 },
  "author_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "is_perlschool_book",
  { data_type => "boolean", default_value => 1, is_nullable => 0 },
  "is_live",
  { data_type => "boolean", default_value => 1, is_nullable => 0 },
  "topic",
  {
    data_type => "varchar",
    default_value => "xxx",
    is_nullable => 0,
    size => 20,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 amazon_sales

Type: has_many

Related object: L<ClaphamTechPress::Schema::Result::AmazonSale>

=cut

__PACKAGE__->has_many(
  "amazon_sales",
  "ClaphamTechPress::Schema::Result::AmazonSale",
  { "foreign.book_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 author

Type: belongs_to

Related object: L<ClaphamTechPress::Schema::Result::Author>

=cut

__PACKAGE__->belongs_to(
  "author",
  "ClaphamTechPress::Schema::Result::Author",
  { id => "author_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07053 @ 2026-07-06 17:06:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RA7jPZUXLjBawSXxkK6l+A

use feature 'signatures';

use DateTime;

with 'MooX::Role::SEOTags', 'ClaphamTechPress::Role::Defaults';

my $img_path = '/img/portfolio/fullsize/';
my $img_suff = '_wide.png';

sub coming_soon($self) {
  my $pubdate = $self->pubdate;
  my $today = DateTime->today;
  return $pubdate > $today;
}

sub og_title($self)       { return $self->title . ' - ' . $self->og_site_name }
sub og_author($self)      { return $self->author->name }
sub og_type($self)        { return 'book' }
sub og_image_alt($self)   { return $self->title }

sub og_description($self) {
  my $has_blurb = $self->blurb && $self->blurb ne 'xxx';

  my $book_description = $has_blurb
    ? $self->blurb
    : $self->subtitle || $self->title . ' by ' . $self->author->name;

  $book_description =~ s/"/&quot;/g; # hack

  return $book_description;
}

sub url_path($self) {
  return '/books/' . $self->slug . '/';
}

sub og_url($self) {
  return $self->domain . $self->url_path;
}

sub og_image($self) {
  return $self->domain . "/$img_path" . $self->image . $img_suff;
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
