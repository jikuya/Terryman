package Terryman::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::Lite;
use JSON qw(decode_json);

any '/' => sub {
    my ($c) = @_;
    my $data;
    my $token = $c->session->get('token');
    my $sign = $c->req->param('signed_request');
    if ( $token ) { # loggedin
        my $ua = LWP::UserAgent->new();
        #my $res = $ua->get("https://graph.facebook.com/me/home?access_token=${token}");
        my $res = $ua->get("https://graph.facebook.com/me/friends?access_token=${token}");
        if ($res->is_success){
            $data = decode_json($res->decoded_content);
            $c->render(
                'index.tt',
                {
                    name      => $c->session->get('name'),
                    data      => $data->{data},
                }
            );
        } else {
            $c->render('login.tt', {login_url => $c->config->{'LOGIN_URL'}});
        }
    } else {
        $c->render('login.tt', {login_url => $c->config->{'LOGIN_URL'}});
    }
};

any '/login' => sub {
    my ($c) = @_;
    $c->session->remove('token');
    $c->redirect('/auth/facebook/authenticate');
};

post '/account/logout' => sub {
    my ($c) = @_;
    $c->session->expire();
    $c->redirect('/');
};

1;
