#!/usr/bin/env perl

use Test::More;
use Test::Output;
use Term::ANSIColor;

use FruitMachine;
use FruitMachine::Reel;
use Player;

=head1 TESTS

This tests part 2 of this challenge. The rule is that for the first pair of
adjacent reels which match wins 5. Any additional pairs add double the previous
value. Pairs can overlap, so red, red, red, blue, green is 2 pairs

=cut

{
    my $reel = FruitMachine::Reel->new();
    is($reel->current_symbol, 'red', 'Default symbol is red');
    stdout_is(
        sub {$reel->print},
        colored(' ', 'black on_red').' ',
        'print method results in single red ANSI block',
    );
}

{
    my $machine = FruitMachine->new();
    is($machine->as_string, 'red red red red red', 'Default machine position is 5 reds');
    stdout_is(
        sub {$machine->print},
        join(" ", map {
            colored(' ', 'black on_red')
        } 1..5)." \n",
        'print method results in 5 ANSI red blocks',
    );
    is($machine->result, 75, 'result for 5 reds is 75.');
}

{
    my $machine = FruitMachine->new(reel_count => 1);
    is($machine->as_string, 'red', 'single reel machine starting position is 1 red');
}

{
    my $player = Player->new();
    is($player->cash, 100, "Default cash for player is 100");
}

{
    my $player = Player->new(cash => 50);
    is($player->cash, 50, "Able to create user with non-default amount of cash");
}

#override defaults for this test, makes things easier to read.
my $SYMBOLS = [qw/1 2 3 4 5/];

my $tests = [
    {
        reels => [qw/1 2 3 4 5/],
        result => 0,
        desc => 'nothing wins 0',
    },
    {
        reels => [qw/1 2 1 2 1/],
        result => 0,
        desc => 'non-adjacent pairs wins 0',
    },
    {
        reels => [qw/1 1 3 4 5/],
        result => 5,
        desc => 'pair at the start wins 5',
    },
    {
        reels => [qw/1 2 3 3 4/],
        result => 5,
        desc => 'pair in the middle wins 5',
    },
    {
        reels => [qw/1 2 3 4 4/],
        result => 5,
        desc => 'pair at the end wins 5',
    },
    {
        reels => [qw/1 1 1 4 5/],
        result => 15,
        desc => 'three of a kind at the start wins 15  (5 + 10)',
    },
    {
        reels => [qw/1 2 2 2 5/],
        result => 15,
        desc => 'three of a kind in the middle wins 15  (5 + 10)',
    },
    {
        reels => [qw/1 2 3 3 3/],
        result => 15,
        desc => 'three of a kind at the end wins 15  (5 + 10)',
    },
    {
        reels => [qw/1 1 2 1 1/],
        result => 15,
        desc => 'two pairs (same symbol) wins 15 (5 + 10)',
    },
    {
        reels => [qw/1 1 2 3 3/],
        result => 15,
        desc => 'two pairs (different symbols) wins 15 (5 + 10)',
    },
    {
        reels => [qw/1 1 1 1 2/],
        result => 35,
        desc => 'four of a kind at the start wins 35 (5 + 10 + 20)',
    },
    {
        reels => [qw/1 2 2 2 2/],
        result => 35,
        desc => 'four of a kind at the end wins 35 (5 + 10 + 20)',
    },
    {
        reels => [qw/1 1 2 2 2/],
        result => 35,
        desc => 'full house (2, then 3) wins 35 (5 + 10 + 20)',
    },
    {
        reels => [qw/1 1 1 2 2/],
        result => 35,
        desc => 'full house (3, then 2) wins 35 (5 + 10 + 20)',
    },
    {
        reels => [qw/1 1 1 1 1/],
        result => 75,
        desc => 'jackpot wins 75 (5 + 10 + 20 + 40)',
    },
];

foreach my $test (@$tests) {
    my $machine = _makeMachine($test->{reels});
    is(
        $machine->result,
        $test->{result},
        $test->{desc},
    );
}

done_testing();

sub _makeMachine {
    my($reel_values) = @_;
    my @reels = map {
        FruitMachine::Reel->new(
            symbols => $SYMBOLS,
            current_symbol => $_,
        )
    } @$reel_values;
    return FruitMachine->new(
        reel_count => scalar @$reel_values,
        reels => \@reels
    );
}
