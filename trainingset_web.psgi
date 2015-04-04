use strict;
use warnings;

use TrainingSet::Web;

my $app = TrainingSet::Web->apply_default_middlewares(TrainingSet::Web->psgi_app);
$app;

