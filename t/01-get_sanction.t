#! /usr/bin/env perl

use strict;
use warnings;
use Test::Most;
use Test::Exception;
use Data::Dumper;

use Locale::Country;
use Locale::Country::OFAC qw(get_sanction_by_code);
use Readonly;

Readonly my $NON_SANCTIONED_STATUS => 0;
Readonly my $SANCTIONED_STATUS     => 1;

my $germany = country2code('germany');
cmp_ok(get_sanction_by_code($germany), '==' ,$NON_SANCTIONED_STATUS, 'Germany not sanctioned');

my $burma = country2code('burma'); ## AKA Myanmar
cmp_ok(get_sanction_by_code($burma), '==' ,$SANCTIONED_STATUS, 'Burma is sanctioned');

my $iran = country2code('iran');
cmp_ok(get_sanction_by_code($iran), '==', $SANCTIONED_STATUS, 'Iran is sanctioned');

my $cuba = country2code('cuba');
cmp_ok(get_sanction_by_code($cuba), '==', $SANCTIONED_STATUS, 'Cuba is sanctioned');

my $sudan = country2code('sudan');
cmp_ok(get_sanction_by_code($sudan), '==', $SANCTIONED_STATUS, 'Sudan is sanctioned');

my $north_korea = country2code('north korea');
cmp_ok(get_sanction_by_code($north_korea), '==', $SANCTIONED_STATUS, 'North Korea is sanctioned');

my $syria = country2code('syria');
cmp_ok(get_sanction_by_code($syria), '==', $SANCTIONED_STATUS, 'Syria is sanctioned');

my $invalid_country = country2code('neverneverland');
dies_ok{ get_sanction_by_code($invalid_country) };

done_testing;
