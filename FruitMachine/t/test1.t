#!/usr/bin/env perl

use Test::More;
use Test::Output;
use Term::ANSIColor;

use FruitMachine;
use FruitMachine::Reel;
use Player;

=head1 TESTS

This is the initial test for the Fruit Machine exercise, and will pass initially.
It confirms the defaults are working as expected, and that the stubs, do not cause
errors.

=cut

#Default reel tests
{
    my $reel = FruitMachine::Reel->new();
    is($reel->current_symbol, 'red', 'Default symbol is red');
    stdout_is(
        sub {$reel->print},
        colored(' ', 'black on_red').' ',
        'print method results in single red ANSI block',
    );
}

#Default machine tests
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
    is($machine->result , 0, 'result for 5 reds is 0 initially, pending further implementation.');
}

#Custom machine tests
{
    my $machine = FruitMachine->new(reel_count => 1);
    is($machine->as_string, 'red', 'single reel machine starting position is 1 red');
}

#Default player tests
{
    my $player = Player->new();
    is($player->cash, 100, "Default cash for player is 100");
}

#Custom player tests
{
    my $player = Player->new(cash => 50);
    is($player->cash, 50, "Able to create user with non-default amount of cash");
}

done_testing();