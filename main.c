# include <stdio.h>
# include "scanner.c"

int main () {
	char *nombresToken[8] = {"", "Identificador", "Constante", "Palabra reservada", "Operador aditivo", "Operador multiplicativo", "Asignación", "Caracter puntuación"};
	enum token t;
	while ((t = yylex()))
		printf("Token: %s\tValor: %s\n", nombresToken[t], yytext);
	return 0;
}
