use File::Spec;
use File::Basename qw(dirname);
my $basedir = File::Spec->rel2abs(File::Spec->catdir(dirname(__FILE__), '..'));
my $dbpath;
if ( -d '/home/dotcloud/') {
    $dbpath = "/home/dotcloud/deployment.db";
} else {
    $dbpath = File::Spec->catfile($basedir, 'db', 'deployment.db');
}
+{
    'DBI' => [
        "dbi:mysql:database=$dbpath",
        'root',
        '',
        {
            mysql_enable_utf8 => 1,
        }
    ],
    Auth => {
        Facebook => {
            client_id       => '166312860171592',                    # アプリケーションID
            client_secret   => 'f6114315282544884d683712e3c37689',   # アプリケーション秘密鍵
            callback_uri    => 'http://apps.facebook.com/terryman/', # FacebookアプリURL
            scope           => 'read_stream,read_friendlists',       # 権限
        }
    },
    'LOGIN_URL' => 'http://59.106.177.81/login',
};
