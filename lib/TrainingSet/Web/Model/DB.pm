package TrainingSet::Web::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'TrainingSet::Web::Schema',

    connect_info => {
        dsn      => 'dbi:Pg:dbname=trainingset',
        user     => '',
        password => '',
    }
);

sub save_votes {
    my ( $self, $votes, $tweets, $user_id ) = @_;
    foreach my $tweet_id ( grep { /[\w\d]{10,}/ } keys $votes ) {
        my $insert_msg =
          $self->resultset('Message')
          ->find_or_create( { id => $tweet_id, text => $tweets->{$tweet_id} } );
        $self->resultset('Vote')->find_or_create(
            {
                user_id      => $user_id,
                vote_type_id => $votes->{$tweet_id},
                message_id   => $insert_msg->get_column('id'),
            }
        );
    }
}

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
