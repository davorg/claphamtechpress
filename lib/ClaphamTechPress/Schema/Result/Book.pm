use utf8;
package ClaphamTechPress::Schema::Result::Book;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ClaphamTechPress::Schema::Result::Book

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

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


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2024-10-02 15:31:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PjSniEsCDVndU2+4qshBVw

use DateTime;

sub coming_soon {
  my $self = shift;
  my $pubdate = $self->pubdate;
  my $today = DateTime->today;
  return $pubdate > $today;
}


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
