package Player;

use Modern::Perl;

use Moo;
use namespace::clean;

=head1 NAME

Player - representation of someone playing a fruit machine.

=head1 SYNOPSIS

This class represents a player of the fruit machine, tracking their interactions
with the machine.

=head1 CONSTRUCTORS

=over 4

=item cash

Integer amount of cash the player currently has

=back

=cut

has cash => (is => 'rw', default => 100);

1;