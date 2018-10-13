%top{
#include <stdio.h>
#include "tokens.h"
}

%{

%}

%option outfile="scanner.c"
%option header-file="scanner.h"
%option noinput
%option nounput


Letra [[:alpha:]]
Digito [0-9]
Alfanumerico [[:alnum:]]
Espacio [[:space:]]
Otro [[:punct:]]{-}[+*/.,()-]  
%% 

programa					return programa;
variables					return variables;
definir						return definir;
leer						return leer;
escribir					return escribir;
codigo						return codigo;
fin						return fin;
"+"						return '+';
"-"						return '-';
"*"						return '*';
"/"						return '/';
"<-"						return asignacion;
"."						return '.';
","						return ',';
"("						return '(';
")"						return ')';
{Letra}{Alfanumerico}*				return identificador;
{Digito}+					return constante;
{Espacio}+					/* ignorar espacios */
"//"(.*)\n					/* ignorar comentarios */	
{Digito}+{Letra}+{Alfanumerico}* 		printf("Error léxico: \t\tConstante inválida: %s\n", yytext);
{Otro}+						printf("Error léxico: \t\tCadena inválida: %s\n", yytext);
{Letra}({Alfanumerico}|{Otro})+			printf("Error léxico: \t\tIdentificador inválido: %s\n", yytext);
.						printf("Error léxico: \t\tCaracter no definido: %s\n", yytext);
