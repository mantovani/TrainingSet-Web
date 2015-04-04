package TrainingSet::Web::View::TT;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config({
    INCLUDE_PATH => [
        TrainingSet::Web->path_to( 'root', 'src' ),
        TrainingSet::Web->path_to( 'root', 'lib' )
    ],
    PRE_PROCESS  => 'config/main',
    WRAPPER      => 'site/wrapper',
    ERROR        => 'error.tt2',
    TIMER        => 0,
    render_die   => 1,
});

=head1 NAME

TrainingSet::Web::View::TT - Catalyst TTSite View

=head1 SYNOPSIS

See L<TrainingSet::Web>

=head1 DESCRIPTION

Catalyst TTSite View.

=head1 AUTHOR

mantovani,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

