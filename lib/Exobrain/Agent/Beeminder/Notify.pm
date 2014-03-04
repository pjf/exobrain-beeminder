package Exobrain::Agent::Beeminder::Notify;

# ABSTRACT: Send a notification every time a bmndr data point is updated
# VERSION

use Exobrain;
use Moose;
use Method::Signatures;

with 'Exobrain::Agent::Run';

method run() {
    $self->exobrain->watch_loop(
        class => 'Measurement::Beeminder',
        then => sub {
            $self->exobrain->notify($_->summary);
        },
    );
}

1;
