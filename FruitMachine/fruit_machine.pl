#!/usr/bin/env perl

use Modern::Perl;
use FruitMachine;
use Getopt::Long;

my $reels = 5;

GetOptions(
    'reels=i' => \$reels,
);

my $machine = FruitMachine->new(
    reel_count => $reels,
);

while (1) {
    my $response = prompt();
    last if $response eq 'q';
    if ($response eq 'p') {
        $machine->print();
    }
    else {
        $machine->spin();
        $machine->print();
    }
}

sub prompt {
    print "Press Enter to spin the reels, 'p' to print the current state, or 'q' to quit: ";
    my $response = <>;
    chomp $response;
    return $response;
}