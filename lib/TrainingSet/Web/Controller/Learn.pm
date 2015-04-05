package TrainingSet::Web::Controller::Learn;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

TrainingSet::Web::Controller::Learn - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

sub base : Chained('/') : PathPart('Learn') : CaptureArgs(0) {
    my ( $self, $c ) = @_;

    # - Get votes options (positive,negative etc)
    $c->stash->{votes} =
      [ map { [ $_->get_column('id'), $_->get_column('text') ] }
          $c->model('DB')->resultset('VoteType')->all ];
}

sub index : Chained('base') : PathPart('') : Args(0) {
    my ( $self, $c ) = @_;

    # - Get tweets to vote
    my $cursor = $c->model('BigData')->get_tweets( $c->user->id );
    while ( my $cursor = $cursor->next ) {
        $c->stash->{tweets}->{ $cursor->{_id} } = $cursor->{text};
    }
    $c->session->{tweets} = $c->stash->{tweets};
}

sub vote : Chained('base') : PathPart('vote') : Args(0) {
    my ( $self, $c ) = @_;
    $c->model('DB')
      ->save_votes( $c->request->params, $c->session->{tweets}, $c->user->id );
    $c->model('BigData')->update_tweets( $c->request->params, $c->user->id );
    $c->res->redirect('/Learn');
}

=encoding utf8

=head1 AUTHOR

mantovani,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
