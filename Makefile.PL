package main;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Net::Defensio',
    AUTHOR              => 'Brad Choate <bchoate@cpan.org>', ## no critic (RequireInterpolationOfMetachars)
    VERSION_FROM        => 'lib/Net/Defensio.pm',
    ABSTRACT_FROM       => 'lib/Net/Defensio.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'Class::Accessor::Fast' => 0,
        'LWP::UserAgent' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Net-Defensio-*' },
);

1;
