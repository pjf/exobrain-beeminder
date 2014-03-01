package Exobrain::Intent::Beeminder;
use Moose;
use Method::Signatures;

# ABSTRACT: Exobrain intent packet for sending data to Beeminder.
# VERSION

=head1 SYNOPSIS

    $exobrain->intent('Beeminder',
        goal    => 'inbox',                     # Mandatory
        value   => 52,                          # Mandatory
        comment => "Submitted via Exobrain",    # Optional
    );

=head1 DESCRIPTION

This intent sends data to Beeminder. It is typically processed by
the L<Exobrain::Agent::Beeminder::Sink> agent.

=cut

method summary() {
    my $summary = join(' ', 'Beeminder: Set', $self->goal, 'to', $self->value);
    
    if (my $comment = $self->comment)  {
        $summary .= " ($comment)";
    }

    return $summary;
}

BEGIN { with 'Exobrain::Intent' }

payload goal    => (isa => 'Str');
payload value   => (isa => 'Num');
payload comment => (isa => 'Str', required => 0);

1;
