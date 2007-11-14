#!/usr/bin/perl -w

use strict;

use Data::Dumper;
use Test::More tests => 4;
use Net::Defensio;

# This is a special API key used for this test suite. Do NOT
# use for production use. Get your own Defensio API key from
# http://defensio.com/signup
my $key = '1234567890abcdefghijklmnopqrstuv';

my $d = Net::Defensio->new( api_key => $key, service_type => 'blog' )
    or die Net::Defensio->errstr;
my $r = $d->audit_comment(
    owner_url => 'http://example.com/',
    user_ip => '127.0.0.1',
    article_date => '2007/11/12',
    comment_author => 'Some Spammer',
    comment_type => 'comment',
    comment_content => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    comment_author_email => 'some.spammer@example.com',
    comment_author_url => 'http://spammers-r-us.example.com',
    permalink => 'http://example.com/test/example.html',
    referrer => 'http://example.com/test/example.html',
    trusted_user => 'false',
    test_force => 'spam,1.0',
)
    or die $d->errstr;

ok( $r->success );
ok( $r->is_spam );

$r = $d->audit_comment(
    owner_url => 'http://example.com/',
    user_ip => '127.0.0.1',
    article_date => '2007/11/12',
    comment_author => 'Some Spammer',
    comment_type => 'comment',
    comment_content => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    comment_author_email => 'some.spammer@example.com',
    comment_author_url => 'http://spammers-r-us.example.com',
    permalink => 'http://example.com/test/example.html',
    referrer => 'http://example.com/test/example.html',
    trusted_user => 'false',
    test_force => 'ham,0.0',
)
    or die $d->errstr;

ok( $r->success );
ok( $r->is_ham );

1;
