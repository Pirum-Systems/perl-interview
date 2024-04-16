# perl-interview
Programming exercise for perl candidates

## Interview process:
The interview is scheduled for 90 minutes. It is formed of the following parts:
- Introduction, outline of how we use Perl at Pirum (15 minutes)
- Discussion about the code in its current state (15 minutes)
  - We would like your thoughts on the code
  - Feel free to review the code prior to the interview
  - If there's anything you're unsure of or unfamiliar with, we're happy to 
    explain.
- Pair programming (45 minutes)
  - There are some improvements that are required in the code in this project.
    Given the requirements which will be shared at the time of the interview,
    you will take the lead and work with the interviewer to implement these
    requirements.
- Final questions (15 minutes)
  - An opportunity for us to better understand each other

## Preparation:
Please get this running on your local machine. You will require the dependencies
as defined in the `cpanfile` file. If all goes well, you should be able to run the
script as follows:

`~/git/perl-interview/FruitMachine> perl -I. fruit_machine.pl`

Also, the first test should pass:
```
prove -I. t/test1.t
t/test1.t .. ok   
All tests successful.
Files=1, Tests=8,  0 wallclock secs ( 0.02 usr  0.00 sys +  0.07 cusr  0.01 csys =  0.10 CPU)
Result: PASS
```

You will be coding during the exercise, so ensure you are able to work on the
files in your preferred IDE, sharing your screen via Microsoft Teams.

## About this exercise
We don't do 'gotcha' questions here - the code was written in line with our
internal coding standards, but has not been reviewed. The intention behind the
exercise is to expose you to the type of code you'll be expected to create or
maintain. It will also allow us to get to know you as a developer - to see what
excites or annoys you, allowing us to determine how easy it'll be for you to
succeed here.