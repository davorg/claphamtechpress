package ClaphamTechPress::Role::Defaults;

use v5.20;
use experimental 'signatures';
use Moo::Role;

requires qw[slug];

sub domain ($self) {
  return 'https://claphamtechpress.com';
}

sub og_url_path ($self) {
  return '/books/' . $self->slug;
}

sub og_url ($self) {
  return $self->domain . $self->og_url_path;
} 

sub og_site_name ($self) {
  return 'Clapham Technical Press';
}

sub og_title ($self) {
  return 'Clapham Technical Press';
}

sub og_description ($self) {
  return 'No description!';
}

sub og_image ($self) {
  my $url = $self->domain;
  my $image;

  if ($self->can('image') and $self->image) {
    $image = $self->image;
  } else {
    $image = '/assets/img/bg-masthead.jpg';
  }

  if ($image !~ m|^https?://|) {
    $image = "$url$image";
  }

  return $image;
}

sub og_type {
  return 'website';
}

sub no_index {
  return 0;
}

1;
