package ClaphamTechPress::IndexPage;

use strict;
use warnings;

use Moo;

with 'MooX::Role::JSON_LD', 'MooX::Role::SEOTags',
    'ClaphamTechPress::Role::Defaults';

sub json_ld_type { return 'WebPage' }
sub json_ld_fields { [] }

sub og_description {
  'Clapham Technical Press publishes practical ' .
  'technical books and helps experts turn their ' .
  'knowledge into ebooks.';
}

sub og_url {
  my ($self) = @_;

  return $self->domain . '/';
}

sub og_image_alt {
  return shift->og_title;
}

sub slug { '' }

1;