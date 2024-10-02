use utf8;
package ClaphamTechPress::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07051 @ 2023-09-25 16:30:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uj5EyhXq5QmdDs7tAjI//A

sub get_schema {
  return __PACKAGE__->connect('dbi:SQLite:./clapham.db');
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
