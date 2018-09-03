#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";


# use this block if you don't need middleware, and only have a single target Dancer app to run here
use microblog;

microblog->to_app;

=begin comment
# use this block if you want to include middleware such as Plack::Middleware::Deflater

use microblog;
use Plack::Builder;

builder {
    enable 'Deflater';
    microblog->to_app;
}

=end comment

=cut

=begin comment
# use this block if you want to mount several applications on different path

use microblog;
use microblog_admin;

use Plack::Builder;

builder {
    mount '/'      => microblog->to_app;
    mount '/admin'      => microblog_admin->to_app;
}

=end comment

=cut

