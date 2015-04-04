#!/bin/bash
perl script/trainingset_web_create.pl model DB DBIC::Schema TrainingSet::Web::Schema create=static dbi:Pg:dbname=trainingset
