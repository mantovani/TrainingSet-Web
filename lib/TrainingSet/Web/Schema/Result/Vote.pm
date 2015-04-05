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

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 user_id

  data_type: 'integer'
  is_nullable: 0

=head2 vote_type_id

  data_type: 'integer'
  is_nullable: 0

=head2 vote_time

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 1
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "message_id",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "user_id",
  { data_type => "integer", is_nullable => 0 },
  "vote_type_id",
  { data_type => "integer", is_nullable => 0 },
  "vote_time",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 1,
    original      => { default_value => \"now()" },
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</message_id>

=item * L</user_id>

=item * L</vote_type_id>

=back

=cut

__PACKAGE__->set_primary_key("message_id", "user_id", "vote_type_id");


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-04-04 22:04:19
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Y/eOvKUR9mAorJa1F0rj+g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
