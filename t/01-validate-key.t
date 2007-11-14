#!/usr/bin/perl -w

use strict;

use Data::Dumper;
use Test::More tests => 1;
use Net::Defensio;

# This is a special API key used for this test suite. Do NOT
# use for production use. Get your own Defensio API key from
# http://defensio.com/signup
my $key = '1234567890abcdefghijklmnopqrstuv';

my $d = Net::Defensio->new( api_key => $key )
    or die Net::Defensio->errstr;
my $r = $d->validate_key( owner_url => 'http://example.com/' )
    or die $d->errstr;

ok( $r->success );

1;
