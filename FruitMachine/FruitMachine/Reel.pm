package FruitMachine::Reel;

use Modern::Perl;
use Term::ANSIColor;
use Const::Fast;

use Moo;
use namespace::clean;

=head1 NAME

Fruit::Machine::Reel - abstraction of a single fruit machine reel.

=head1 SYNOPSIS

This class represents a reel on a fruit machine, consisting of a number of
symbols, any of which can be the current 'selection'.

=head1 CONSTRUCTORS

=over 4

=item symbols

An arrayref of ANSI colour names, in the format supported by L<Term::ANSIColor>

=item current_symbol

The current symbol to be displayed

=back

=head1 METHODS

=over 4

=item spin

Spin this reel, selecting a random value from L</symbols> and assigning it to
L</current_symbol>

=item print

Print the current reel to the screen.

=back

=cut

const my $DEFAULT_SYMBOLS => [qw/red white green yellow/];

has symbols => (is => 'ro', required => 1, default => sub { $DEFAULT_SYMBOLS });

has current_symbol => (is => 'rw', required => 1, default => sub { $DEFAULT_SYMBOLS->[0] });

sub spin {
    my($self) = @_;
    $self->current_symbol($self->symbols->[int rand scalar @{$self->symbols}]);
    return;
}

sub print {
    my($self) = @_;
    print colored(' ', 'black on_'.$self->current_symbol).' ';
    return;
}

1;