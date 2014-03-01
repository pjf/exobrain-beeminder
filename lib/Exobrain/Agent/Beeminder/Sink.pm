package Exobrain::Agent::Beeminder::Sink;
use Moose;
use Method::Signatures;
use WebService::Beeminder;

with 'Exobrain::Agent::Beeminder';
with 'Exobrain::Agent::Run';

# ABSTRACT: Send exobrain intents to Beeminder
# VERSION

method run() {
    my $bee = WebService::Beeminder->new(
        token => $self->config->{auth_token}
    );

    $self->exobrain->watch_loop(
        class => 'Intent::Beeminder',
        then  => sub {
            my $event = shift;
            $bee->add_datapoint(
                goal    => $event->goal,
                value   => $event->value,
                comment => $event->comment // "",
            );
        }
    );
}

1;
