package FruitMachine;

use Modern::Perl;
use FruitMachine::Reel;

use Moo;
use namespace::clean;

=head1 NAME

Fruit::Machine - Implementation of a simple fruit machine

=head1 SYNOPSIS

This class represents a fruit machine, containing a set of L<FruitMachine::Reel>
reels

=head1 CONSTRUCTORS

=over 4

=item reel_count

The integer number of reels on this fruit machine

=item reels

An array of L<FruitMachine::Reel> objects, representing the individual reels
on the machine.

=back

=head1 METHODS

=over 4

=item spin

Spins all reels, setting them to a random value

=item print

Print all current reels to the screen

=item as_string

Returns all reel values as plain text, split by a space

=item result

The integer amount won, given the current set of reels.

=back

=cut

has reel_count => (is => 'ro', required => 1, default => sub { 5 });

has 'reels' => (is => 'lazy', builder => sub {
    my($self) = @_;
    my @reels;
    for (1 .. $self->reel_count) {
        push @reels, FruitMachine::Reel->new();
    }
    return \@reels;
});

sub spin {
    my($self) = @_;
    $_->spin() for @{$self->reels};
}

sub print {
    my($self) = @_;
    $_->print() for @{$self->reels};
    print "\n";
}

sub as_string {
    my($self) = @_;
    return join(" ", map {$_->current_symbol} @{$self->reels});
}

sub result {
    return 0;
}

1;