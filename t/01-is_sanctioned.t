#! /usr/bin/env perl

use strict;
use warnings;
use Test::Most;
use Test::Exception;
use Data::Dumper;

use Locale::Countries::OFAC;
use Readonly;

Readonly my $NON_SANCTIONED_STATUS => 0;
Readonly my $SANCTIONED_STATUS => 1;

subtest "create a valid country (Germany) that is not sanctioned" => sub {
    my $country = Countries::Sanctioned->new({ country_code => 'DE' });

    ok( defined $country->country_code);
    cmp_ok( $country->get_sanction, '==', $NON_SANCTIONED_STATUS, 'not sanctioned');
};
subtest "create sanctioned Burma country" => sub {
    my $country = Countries::Sanctioned->new({ country_code => 'MMR' });

    ok(defined $country->country_code);

    my $status = $country->status($country->country_code );
    cmp_ok( $country->get_sanction, '==', $SANCTIONED_STATUS, 'sanctioned');
};

subtest "create sanctioned Iran country" => sub {
    my $country = Countries::Sanctioned->new({ country_code => 'IRN' });

    ok(defined $country->country_code);

    my $status = $country->status($country->country_code );
    cmp_ok( $country->get_sanction, '==', $SANCTIONED_STATUS, 'sanctioned');
};

subtest "create sanctioned Cuba country" => sub {
    my $country = Countries::Sanctioned->new({ country_code => 'CUB' });

    ok(defined $country->country_code);

    my $status = $country->status($country->country_code );
    cmp_ok( $country->get_sanction, '==', $SANCTIONED_STATUS, 'sanctioned');
};

subtest "create sanctioned Sudan country" => sub {
    my $country = Countries::Sanctioned->new({ country_code => 'SSD' });

    ok(defined $country->country_code);

    my $status = $country->status($country->country_code );
    cmp_ok( $country->get_sanction, '==', $SANCTIONED_STATUS, 'sanctioned');
};

subtest "create sanctioned north korea country" => sub {
    my $country = Countries::Sanctioned->new({ country_code => 'PRK' });
    ok(defined $country->country_code);

    my $status = $country->status($country->country_code );
    cmp_ok( $country->get_sanction, '==', $SANCTIONED_STATUS, 'sanctioned');
};

subtest "create sanctioned syria country" => sub {
    my $country = Countries::Sanctioned->new({ country_code => 'SY' });
    ok(defined $country->country_code);

    my $status = $country->status($country->country_code );
    cmp_ok( $country->get_sanction, '==', $SANCTIONED_STATUS, 'sanctioned');
};

subtest "create undefined country" => sub {
    dies_ok {         
        my $country = Countries::Sanctioned->new({ country_code => undef });
    }
};
done_testing;
