use utf8;
package ClaphamTechPress::Schema::Result::Author;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ClaphamTechPress::Schema::Result::Author

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

=head1 TABLE: C<author>

=cut

__PACKAGE__->table("author");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 bio

  data_type: 'varchar'
  is_nullable: 1
  size: 1000

=head2 sortname

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 website

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "bio",
  { data_type => "varchar", is_nullable => 1, size => 1000 },
  "sortname",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "website",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 books

Type: has_many

Related object: L<ClaphamTechPress::Schema::Result::Book>

=cut

__PACKAGE__->has_many(
  "books",
  "ClaphamTechPress::Schema::Result::Book",
  { "foreign.author_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-09-25 16:30:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:q58h3MlOcQEysG1TkUeukw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
