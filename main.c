/*
UTNFRBA
Tp3 - año 2018
Materia: Sintaxis y semantica de los lenguajes.
Curso: K2055
Profesor: Eduardo Zuñiga.
Grupo: 3
Integrantes:
            Mariano Antico, Legajo: 164549-3
            Nicolás D. Felicetti, Legajo: 163608-0
            Enzo Nuñez, Legajo: 164949-8
            Gonzalo Bonora, Legajo: 156036-0 
*/


# include <stdio.h>
# include "scanner.h"

int main () {
	char *nombresToken[12] = {"", "Identificador", "Constante", "Asignación", "Programa", "Variables", "Definir", "Leer", "Escribir", "Código", "Fin"};
	enum token t;
	while ((t = yylex())){
		if (t<13){
			printf("Token: %s\tValor: %s\n", nombresToken[t], yytext);
		} else printf("Token: %s\n", yytext);
	}
	return 0;
}
