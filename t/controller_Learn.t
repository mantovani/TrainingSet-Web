use strict;
use warnings;
use Test::More;


use Catalyst::Test 'TrainingSet::Web';
use TrainingSet::Web::Controller::Learn;

ok( request('/learn')->is_success, 'Request should succeed' );
done_testing();
