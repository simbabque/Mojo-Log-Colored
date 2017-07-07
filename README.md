# NAME

Mojo::Log::Colored - Colored Mojo logging

<div>
    # SYNOPSIS

        use Mojo::Log::Colored;

        # Log to STDERR
        $app->log(
            Mojo::Log::Colored->new(
                
                # optionally set the colors
                colors => {
                    debug => "bold bright_white",
                    info  => "bold bright_blue",
                    warn  => "bold green",
                    error => "bold yellow",
                    fatal => "bold yellow on_red",
                }
            )
        );   
        

    # DESCRIPTION

    Mojo::Log::Colored is a logger for Mojolicious with colored output for the terminal. It lets you define colors
    for each log level based on L<Term::ANSIColor> and comes with sensible default colors. The full lines in the log
    will be colored.

    Since this inherits from L<Mojo::Log> you can still give it a C<file>, but the output would also be colored.
    That does not make a lot of sense, so you don't want to do that. Use this for development, not production.

    # ATTRIBUTES

    L<Mojo::Log::Colored> implements the following attributes.

    ## colors

        my $colors = $log->colors;
        $log->colors(
            {
                debug => "bold bright_white",
                info  => "bold bright_blue",
                warn  => "bold green",
                error => "bold yellow",
                fatal => "bold yellow on_red",
            }
        );


    Takes a hash reference with the five log levels as keys and strings of colors as values. Refer to
    L<Term::ANSIColor> for more information about what kind of color you can use.

    ## format

        my $cb = $log->format;
        $log   = $log->format( sub { ... } );


    A callback for formatting log messages. See L<Mojo::Log> for more information.

    # METHODS

    L<Mojo::Log::Colored> inherits all methods from L<Mojo::Log> and does not implement new ones.

    # SEE ALSO

    L<Mojo::Log>, L<Term::ANSIColor>

    # LICENSE

    Copyright (C) simbabque.

    This library is free software; you can redistribute it and/or modify
    it under the same terms as Perl itself.

    # AUTHOR

    simbabque E<lt>simbabque@cpan.orgE<gt>
</div>
