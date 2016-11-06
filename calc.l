%{
	#include "head.h"
	#include "y.tab.h"
	void yyerror(char *);
	// int yylineno = 1; //en windows se declara
%}

%%
"print"			{return PRINT;}
"exit"			{return EXIT_COMMAND;}

[+-]?[0-9]		{yylval = atoi(yytext); return INTEGER;}	/*va retornar su valor*/					/*enteros*/
[a-zA-Z]		{yylval = *yytext - 'a'; return ID;}		/*retorna su valor en ascii*/					/*identificadores*/
[-+*/(){}=/cd^;]	{return *yytext;}				/*retorna lo que trae el puntero*/				/*operadores*/	
[ \t]			;														/*tablulaciones*/		
[ \n]			{yylineno++;}					/*va incrementando las lineas cuando hay un salto de linea*/	/*cuenta lineas*/

.			{ECHO; yyerror("caracter invalido");}		/*error*/ 	/*CUALQUIER OTRA COSA SERA UN ERROR*/

%%

int yywrap(void){
	return 1;
}
