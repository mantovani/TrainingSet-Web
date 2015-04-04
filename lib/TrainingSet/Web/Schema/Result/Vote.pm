use utf8;
package TrainingSet::Web::Schema::Result::Vote;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TrainingSet::Web::Schema::Result::Vote

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<votes>

=cut

__PACKAGE__->table("votes");

=head1 ACCESSORS

=head2 message_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 vote_type_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 vote_time

  data_type: 'timestamp'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "message_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "user_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "vote_type_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "vote_time",
  { data_type => "timestamp", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</message_id>

=item * L</user_id>

=item * L</vote_type_id>

=back

=cut

__PACKAGE__->set_primary_key("message_id", "user_id", "vote_type_id");

=head1 RELATIONS

=head2 message

Type: belongs_to

Related object: L<TrainingSet::Web::Schema::Result::Message>

=cut

__PACKAGE__->belongs_to(
  "message",
  "TrainingSet::Web::Schema::Result::Message",
  { id => "message_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 user

Type: belongs_to

Related object: L<TrainingSet::Web::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "TrainingSet::Web::Schema::Result::User",
  { id => "user_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 vote_type

Type: belongs_to

Related object: L<TrainingSet::Web::Schema::Result::VoteType>

=cut

__PACKAGE__->belongs_to(
  "vote_type",
  "TrainingSet::Web::Schema::Result::VoteType",
  { id => "vote_type_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-04-04 17:43:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:n5Xx0mFj2brwu2mK7b87Dg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
