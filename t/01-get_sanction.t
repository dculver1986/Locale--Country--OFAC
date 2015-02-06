#! /usr/bin/env perl

use strict;
use warnings;
use Test::Most;
use Test::Exception;

use Locale::Country;
use Locale::Country::OFAC qw( get_sanction_by_code is_region_sanctioned );
use Readonly;

Readonly my $NON_SANCTIONED_STATUS => 0;
Readonly my $SANCTIONED_STATUS     => 1;

cmp_ok( get_sanction_by_code('DE'),
    '==', $NON_SANCTIONED_STATUS, 'Germany not sanctioned' );

cmp_ok( get_sanction_by_code('IR'),
    '==', $SANCTIONED_STATUS, 'Iran is sanctioned' );

cmp_ok( get_sanction_by_code('CU'),
    '==', $SANCTIONED_STATUS, 'Cuba is sanctioned' );

cmp_ok( get_sanction_by_code('SD'),
    '==', $SANCTIONED_STATUS, 'Sudan is sanctioned' );

cmp_ok( get_sanction_by_code('KP'),
    '==', $SANCTIONED_STATUS, 'North Korea is sanctioned' );

cmp_ok( get_sanction_by_code('SY'),
    '==', $SANCTIONED_STATUS, 'Syria is sanctioned' );

cmp_ok( get_sanction_by_code('IRN'),
    '==', $SANCTIONED_STATUS, 'Iran is sanctioned' );

cmp_ok( get_sanction_by_code('CUB'),
    '==', $SANCTIONED_STATUS, 'Cuba is sanctioned' );

cmp_ok( get_sanction_by_code('SDN'),
    '==', $SANCTIONED_STATUS, 'Sudan is sanctioned' );

cmp_ok( get_sanction_by_code('PRK'),
    '==', $SANCTIONED_STATUS, 'North Korea is sanctioned' );

cmp_ok( get_sanction_by_code('SYR'),
    '==', $SANCTIONED_STATUS, 'Syria is sanctioned' );


my $invalid_country = country2code('neverneverland');
dies_ok { get_sanction_by_code($invalid_country) };

dies_ok { is_region_sanctioned( 'DE', '') };

dies_ok { is_region_sanctioned('', 123456) };


for my $num ( 95000..99999 ) {
    my $ru_crimea_result = is_region_sanctioned('RU', $num);
    cmp_ok( $ru_crimea_result, '==', $SANCTIONED_STATUS,
        'Russian Crimean zip correctly sanctioned' );
    my $rus_crimea_result = is_region_sanctioned('RUS', $num);
    cmp_ok( $rus_crimea_result, '==', $SANCTIONED_STATUS,
        'Russian Crimean zip correctly sanctioned' );

    my $ua_crimea_result = is_region_sanctioned('UA', $num);
    cmp_ok( $ua_crimea_result, '==', $SANCTIONED_STATUS,
        'Ukraine Crimean zip correctly sanctioned' );

    my $ukr_crimea_result = is_region_sanctioned('UKR', $num);
    cmp_ok( $ukr_crimea_result, '==', $SANCTIONED_STATUS,
        'Ukraine Crimean zip correctly sanctioned' );

}

for my $int ( 295000..295999 ) {
    my $ru_crimea_result = is_region_sanctioned('RU', $int );
    cmp_ok( $ru_crimea_result, '==', $SANCTIONED_STATUS,
        'Russian Crimean zip correctly sanctioned' );
    my $rus_crimea_result = is_region_sanctioned('RUS', $int );
    cmp_ok( $rus_crimea_result, '==', $SANCTIONED_STATUS,
        'Russian Crimean zip correctly sanctioned' );

    my $ua_crimea_result = is_region_sanctioned('UA', $int );
    cmp_ok( $ua_crimea_result, '==', $SANCTIONED_STATUS,
        'Ukraine Crimean zip correctly sanctioned' );

    my $ukr_crimea_result = is_region_sanctioned('UKR', $int );
    cmp_ok( $ukr_crimea_result, '==', $SANCTIONED_STATUS,
        'Ukraine Crimean zip correctly sanctioned' );


}

my $ger_result = is_region_sanctioned('DE', 12345);
cmp_ok($ger_result, '==', $NON_SANCTIONED_STATUS,
    'Germany zip correctly not sanctioned' );

done_testing;
