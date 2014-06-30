#! /usr/bin/perl -w

use strict;

my @ips; #Guardar Direcciones IP
my @red; #Guardar segmento de red
my $dir="";

open(CONFIG,"<my.conf") or die "No se puede abrir el archivo\n";
while (<CONFIG>){

        chomp($_);

        if( ($_ =~ /#[.]*/) || length($_) ==0){ next(); }

        #Direcciones IP
        if($_ =~ /((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)+(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3})/){
                        push(@ips,$_);
                        print "$_\n";
                        next();
                }

       #Segmentos de Red :D
        if($_ =~/(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\/d{1,2})/ ){

                        push(@red,$_);
                        print "$_\n";
                        next();

                }
        #directorio :D
        if($_ =~ /(C:\\.*)/i){
                        $dir = $_;
                        print "$_\n";
                        next();
                }
        }

close(CONFIG);


