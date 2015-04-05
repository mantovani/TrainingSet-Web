package TrainingSet::Web::Schema::ResultSet::Vote;

use strict;
use warnings;

use base 'DBIx::Class::ResultSet';

sub save_votes {
    my ( $self, $votes, $tweets, $user_id ) = @_;
    foreach my $tweet_id ( grep { /[\w\d]{10,}/ } keys $votes ) {
        my $insert_msg =
          $self->resultset('Message')
          ->find_or_create( { id => $tweet_id, text => $tweets->{$tweet_id} } );
        $self->create(
            {
                user_id      => $user_id,
                vote_type_id => $votes->{$tweet_id},
                message_id   => $insert_msg->get_column('id'),
            }
        );
    }
}

1;
