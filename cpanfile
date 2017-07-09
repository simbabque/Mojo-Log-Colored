requires 'perl', '5.008001';
requires 'Term::ANSIColor', '3.00';
requires 'Mojolicious', '5.00';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Capture::Tiny';
};

