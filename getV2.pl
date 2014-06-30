use LWP::Simple;
use strict;


my $some;

#Creacion del archivo Index
$some=get("http://www.seguridad.unam.mx/");

#Creacion del archivo Index
open(HTML,">index2.html") or die "No se pudo crear el archivo\n";
        print HTML $some;
close(HTML);
