use strict;
use warnings;
use Test::More;


use Catalyst::Test 'TrainingSet::Web';
use TrainingSet::Web::Controller::Login;

ok( request('/login')->is_success, 'Request should succeed' );
done_testing();
