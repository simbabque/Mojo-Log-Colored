requires 'perl', '5.008001';
requires 'Term::ANSIColor';
requires 'Mojolicious';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Capture::Tiny';
};

