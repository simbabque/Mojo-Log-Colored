requires 'perl', '5.008001';
requires 'Term::ANSIColor', '3.00';
requires 'Mojolicious';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Capture::Tiny';
};

