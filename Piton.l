%option noyywrap
%option yylineno
/* Analizador para un lenguaje al estilo de Piton */

%{
/* se necesita esto para la llamada a atof() mas abajo */
#include <math.h>
int contError= 0;
%}

DIGITO   [0-9]
ID       [a-zA-Z0-9]*

%%

{DIGITO}+   { printf( "Un entero: %s (%d)\n", yytext, atoi( yytext ) );}

{DIGITO}+","{DIGITO}*      {  printf( "Un real: %s (%g)\n", yytext, atof( yytext ) );}

"Iniciar"|"iniciar"      {  printf( "Una palabra reservada para inicio : %s\n", yytext );}

"Terminar"|"terminar"  {  printf( "Una palabra reservada para  fin de programa : %s\n", yytext ); return 0;}

"Entero"|"entero" {  printf( "Una palabra reservada para definir tipo variable Entero : %s\n", yytext );}

"Caracter"|"caracter" {  printf( "Una palabra reservada para definir tipo variable Caracter : %s\n", yytext );}

"Booleano"|"booleano" {  printf( "Una palabra reservada para definir tipo variable Booleano : %s\n", yytext );}

"Leer"|"leer"  {  printf( "Una palabra reservada de entrada : %s\n", yytext );}

"Escribir"|"escribir"|"Imprimir"|"imprimir" {  printf( "Una palabra reservada de salida : %s\n", yytext );}

"Si"|"Sino"|"Fin Si"|"Segun"|"Caso"|"Fin Segun" {  printf( "Una palabra reservada para condicionales : %s\n", yytext );}

"Para"|"Mientras"|"Fin Mientras"|"Fin Para"|"Hasta Que"|"Desde"|"Repetir" {  printf( "Una palabra reservada para ciclos: %s\n", yytext );}

{ID}       { printf( "Un identificador: %s\n", yytext ); }

"+"|"-"|"*"|"/"   { printf( "Un operador: %s\n", yytext ); }

":"|":=" { printf( "Una asignacion: %s\n", yytext ); }

","|";" { printf( "Un separador: %s\n", yytext ); }

"{"[^}\n]*"}"     /* se come una linea de comentarios */

[ \t\n]+          /* se come los espacios en blanco */

.                 { printf( "Caracter no reconocido: %s\n", yytext ); }

%%

main( )
    {
    printf(" Analizador para algunos elementos de un lenguaje al estilo de Piton en castellano\n");
    yyin = fopen( "prog.pas", "r" );
    yylex();
    printf("Presiones una tecla para terminar...");
    getchar();
 }