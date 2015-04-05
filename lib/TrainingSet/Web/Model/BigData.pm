package TrainingSet::Web::Model::BigData;

use Moose;
BEGIN { extends 'Catalyst::Model::MongoDB' }

__PACKAGE__->config(
    host           => '127.0.0.1',
    port           => '27017',
    dbname         => 'BigData',
    collectionname => '',
    gridfs         => '',
);

has 'twitter' => (
    is      => 'ro',
    isa     => 'Any',
    lazy    => 1,
    default => sub { shift->collection('TwitterStreaming') }
);

sub get_tweets {
    my ( $self, $user_id ) = @_;
    $self->twitter->find(
        {
            'text' => { '$exists' => 1 },
            'learning_machine.users' => { '$ne' => { '$in' => [$user_id] } },
            'learning_machine.ignore' => { '$ne' => 1 }
        }
    )->sort( { 'learning_machine.votes' => 1 } )->limit(30);
}

sub update_tweets {
    my ( $self, $votes, $user_id ) = @_;
    foreach my $vote ( grep { /[\w\d]{10,}/ } keys $votes ) {
        $self->twitter->update(
            { _id => MongoDB::OID->new($vote) },
            $votes->{$vote} < 4
            ? $self->_update_tweet($user_id)
            : $self->_update_tweet_ignore($user_id)
        );
    }
}

sub _update_tweet {
    my ( $self, $user_id ) = @_;
    return {
        '$inc'      => { 'learning_machine.votes' => 1 },
        '$addToSet' => { 'learning_machine.users' => [$user_id] }
    };
}

sub _update_tweet_ignore {
    my ( $self, $user_id ) = @_;
    return {
        '$inc'      => { 'learning_machine.votes'  => 1 },
        '$addToSet' => { 'learning_machine.users'  => [$user_id] },
        '$set'      => { 'learning_machine.ignore' => 1 }
    };
}

=head1 NAME

TrainingSet::Web::Model::BigData - MongoDB Catalyst model component

=head1 SYNOPSIS

See L<TrainingSet::Web>.

=head1 DESCRIPTION

MongoDB Catalyst model component.

=head1 AUTHOR

mantovani,,,

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

no Moose;
__PACKAGE__->meta->make_immutable;

1;
