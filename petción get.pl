#! /usr/bin/perl -w
use Socket;
use strict;
my( $host, $in_addr, $proto, $port, $addr, $file, $archivo);

$host = "seguridad.unam.mx";
$file = "/"; # el index vamos...
$port = 80;
$proto = getprotobyname('tcp');
$in_addr = inet_aton($host);
$addr = sockaddr_in($port, $in_addr);
# creamos el socket y conectamos al servidor
socket(S, AF_INET, SOCK_STREAM, $proto) or die "socket: $!";
connect(S, $addr) or die "connect: $!";
# para flushear nada mas escribir en el socket
select(S); $| = 1; select(STDOUT);

# Una peticion normal GET
print S "GET $file HTTP/1.1\nHOST: $host\n\n";

open($archivo,">index.html");

while(<S>)
{
        print $archivo " $_";
}
close($archivo);

