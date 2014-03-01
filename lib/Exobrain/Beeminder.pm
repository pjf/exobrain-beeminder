package Exobrain::Beeminder;
use Moose;

# ABSTRACT: Beeminder components for exobrain
# VERSION

=head1 SYNOPSIS

    $ ubic start exobrain.beeminder

=head1 DESCRIPTION

This distribution provides Beeminder access to L<Exobrain>.

Once enabled, services can be controlled using C<ubic>. Try
C<ubic status> to see them, and C<ubic start exobrain.beeminder> to
start the beeminder framework.

=head1 PROVIDED CLASSES

This component provides the following agents:

=over

=item L<Exobrain::Agent::Beeminder::Source>

=item L<Exobrain::Agent::Beeminder::Sink>

=back

It also provides L<Exobrain::Intent::Beeminder> and
L<Exobrain::Measurement::Beeminder> classes for sending and
receiving Beeminder datapoints, respectively.

=cut

with 'Exobrain::Component';

# This is the namespace everything will be installed in by default.
# It's automatically prepended with 'exobrain'

sub component { "beeminder" };

# These are the services in that namespace. So we have
# 'exobrain.beeminder.source' and 'exobrain.beeminder.sink'.

sub services {
    return (
        source   => 'Beeminder::Source',
        sink     => 'Beeminder::Sink',
    )
}

1;

=for Pod::Coverage component services
