package Exobrain::Agent::Beeminder;
use Moose::Role;

# VERSION
# ABSTRACT: Provide common functions for Beeminder agents.

with 'Exobrain::Agent';

sub component_name { "Beeminder" };

1;

=for Pod::Coverage component_name
