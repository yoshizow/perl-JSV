use strict;
use warnings;

use Test::More;
use Test::JSV::Suite;
use JSV::Validator;

use File::Spec;
use File::Basename;

my $validator = JSV::Validator->new;

subtest "strict type" => sub {
    Test::JSV::Suite->run(
        base_dir => File::Spec->catdir(File::Spec->no_upwards(dirname(__FILE__), "../../../suite/tests")),
        version => "draft4",
        suite   => "optional/format",
        cb      => sub {
            my ($schema, $instance) = @_;
            return $validator->validate($schema, $instance);
        },
        skip_test_cases => { "a valid protocol-relative URI" => 1, },
    );
};

subtest "strict type (additional suite)" => sub {
    Test::JSV::Suite->run(
        base_dir => File::Spec->catdir(File::Spec->no_upwards(dirname(__FILE__), "../../../additional_suite/tests")),
        version => "draft4",
        suite   => "optional/format",
        cb      => sub {
            my ($schema, $instance) = @_;
            return $validator->validate($schema, $instance);
        },
        skip_test_cases => { "a valid protocol-relative URI" => 1, },
    );
};

subtest "loose type" => sub {
    Test::JSV::Suite->run(
        base_dir => File::Spec->catdir(File::Spec->no_upwards(dirname(__FILE__), "../../../suite/tests")),
        version => "draft4",
        suite   => "optional/format",
        cb      => sub {
            my ($schema, $instance) = @_;
            return $validator->validate($schema, $instance, +{ loose_type => 1 });
        },
        skip_test_cases => { "a valid protocol-relative URI" => 1, },
    );
};

subtest "loose type (additional_suite)" => sub {
    Test::JSV::Suite->run(
        base_dir => File::Spec->catdir(File::Spec->no_upwards(dirname(__FILE__), "../../../additional_suite/tests")),
        version => "draft4",
        suite   => "optional/format",
        cb      => sub {
            my ($schema, $instance) = @_;
            return $validator->validate($schema, $instance, +{ loose_type => 1 });
        },
        skip_test_cases => { "a valid protocol-relative URI" => 1, },
    );
};

done_testing;
