package Countries::Sanctioned;

use strict;
use warnings;
use Moose;
use Carp;

use feature 'switch';

has country_code => (
    is  => 'rw',
    isa => 'Str',
    required => 1,
);

has sanction => (
    is  => 'ro',
    isa => 'Int',
    lazy => 1,
    writer    => 'set_sanction',
    reader    => 'get_sanction',
    default   => 0,
);

sub status {
    my $self = shift;
    my $country_code = shift;

    given( $country_code ) {
        when(m/MMR|MM/) { $self->set_sanction(1) }
        when(m/IRN|IR/) { $self->set_sanction(1) }
        when(m/CUB|CU/) { $self->set_sanction(1) }
        when(m/SSD|SS/) { $self->set_sanction(1) }
        when(m/PRK|PK/) { $self->set_sanction(1) }
        when(m/SYR|SY/) { $self->set_sanction(1) }
        when(!defined)  {
            croak "Country Code undefined";
        }
    }
    my $result = $self->get_sanction;
    return $result;
}

1;
