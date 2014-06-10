package Locale::Country::OFAC;

use strict;
use warnings;

use Exporter;
use Carp;

our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(get_sanction_by_code);

# VERSION
# ABSTRACT: Module to look up OFAC Sanctioned Countries

=pod

=encoding utf8

=head1 NAME

Locale::Country::OFAC

=head1 SYNOPSIS

    use strict;
    use warnings;
    use Locale::Country;

    use Local::Country::OFAC qw( get_sanction_by_code );

    my $cuba = country2code('cuba');
    get_sanction_by_code($cuba);

=head1 DESCRIPTION

Module to lookup if a country is OFAC Sanctioned.
Takes a country code and returns a true value if it is.

=head1 METHODS

my $iran = 'IR';

if (get_sanction_by_code($iran) ) {
    print "Sorry, can't do business- country is Sanctioned\n";
}

Returns 1 if the country is sanctioned, 0 if not.
It also accepts lower case and 3 letter country codes.

=head1 AUTHOR

Daniel 'The Man' Culver

=head1 THANKS TO

Robert Stone, drzigman@cpan.org

PerlMonks, www.perlmonks.com

=head1 COPYRIGHT

This module is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=cut



our %sanctioned_country_codes =
  map { $_ => 1 } qw( MMR MM IRN IR CUB CU SSD SD PRK KP SYR SY );

sub get_sanction_by_code {
    my $country_code = shift || croak "get_sanction_by_code requires country code";

    if (   $sanctioned_country_codes{ uc $country_code }
        || $sanctioned_country_codes{ lc $country_code } )
    {
        return 1;
    }
    else {
        return 0;
    }
}

1;
