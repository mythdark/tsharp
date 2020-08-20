<?PHP
define('UPDATE_URL', 'https://raw.githubusercontent.com/grollcake-torr/torr/master/torr.encoded');
$remote_base64 = trim(file_get_contents(UPDATE_URL));
$local_base64 = base64_encode(file_get_contents(__FILE__));
$decoded_source = base64_decode($remote_base64);
file_put_contents(__FILE__, $decoded_source);
