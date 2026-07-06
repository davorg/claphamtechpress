use utf8;
package ClaphamTechPress::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07053 @ 2026-07-06 17:06:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ITYRNh2X80M3wAnV3RdI+A

sub get_schema {
  return __PACKAGE__->connect('dbi:SQLite:./clapham.db');
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable(inline_constructor => 0);
1;
