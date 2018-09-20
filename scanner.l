%top{
#include <stdio.h>
#include "tokens.h"
}

%{

%}

%option outfile="scanner.c"
%option noinput
%option nounput
%option nodefault

Letra [[:alpha:]]
Digito [0-9]
Alfanumerico [[:alnum:]]
Espacio [[:space:]]
Otro [!#$%&':;<=>\?@\[\]\^`_\{\}~"]  
%% 

programa					|
variables					|
definir						|
leer						|
escribir					|
codigo						|
fin						return palabraReservada;
[\+\-]						return operadorAditivo;
[\*\/]						return operadorMultiplicativo;
"<-"						return asignacion;
[\.,\(\)]					return caracterPuntuacion;
[\.,\(\)]/(.+)					return caracterPuntuacion;
{Letra}{Alfanumerico}*				return identificador;
{Digito}+					return constante;
{Espacio}+					/* ignorar espacios */
"//"(.*)\n					/* ignorar comentarios */	
{Digito}+{Letra}+{Alfanumerico}* 		printf("Error léxico: \t\tConstante inválida: %s\n", yytext);
{Otro}+						printf("Error léxico: \t\tCadena inválida: %s\n", yytext);
{Letra}({Alfanumerico}|{Otro})+			printf("Error léxico: \t\tIdentificador inválido: %s\n", yytext);
.						printf("Error léxico: \t\tCaracter no definifo: %s\n", yytext);
