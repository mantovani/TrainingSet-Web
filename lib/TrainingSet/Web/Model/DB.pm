package TrainingSet::Web::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'TrainingSet::Web::Schema',
    
    connect_info => {
        dsn => 'dbi:Pg:dbname=trainingset',
        user => '',
        password => '',
    }
);

=head1 NAME

TrainingSet::Web::Model::DB - Catalyst DBIC Schema Model

=head1 SYNOPSIS

See L<TrainingSet::Web>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<TrainingSet::Web::Schema>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema - 0.65

=head1 AUTHOR

mantovani

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
