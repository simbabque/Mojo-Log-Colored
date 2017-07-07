use strict;
use warnings;
use Test::More;
use Test::Mojo;
use Mojolicious::Lite;
use Mojo::Log::Colored;

my $log = q{};
open my $fh, ">", \$log or die $!;

my $logger = Mojo::Log::Colored->new( handle => $fh );
$logger->format( sub { $_[1] } );
app->log($logger);

get '/debug' => sub { app->log->debug('foo'); shift->render( template => 'foo' ); };
get '/info'  => sub { app->log->info('foo');  shift->render( template => 'foo' ); };
get '/warn'  => sub { app->log->warn('foo');  shift->render( template => 'foo' ); };
get '/error' => sub { app->log->error('foo'); shift->render( template => 'foo' ); };
get '/fatal' => sub { app->log->fatal('foo'); shift->render( template => 'foo' ); };

my %defaults = (
    debug => "\e[1;97m",
    info  => "\e[1;94m",
    warn  => "\e[1;32m",
    error => "\e[1;33m",
    fatal => "\e[1;33;41m",
);

my $t = Test::Mojo->new;
for my $level ( sort keys %defaults ) {
    $t->get_ok("/$level")->status_is(200)->content_is("ok\n");

    like $log, qr{
        \Q$defaults{$level}\E   # color of this level, escaped
        $level
        \e\[0m                  # end of coloring
    }x, "log contains colors for $level";

    $log = q{};
}
done_testing;

__DATA__
@@ foo.html.ep
ok
