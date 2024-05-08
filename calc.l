%{
#include "y.tab.h"
void yyerror (char *s);
int yylex();
%}
%%
"exit"				   {return exit_command;}
[0-9]+                 {yylval.num = atoi(yytext); return number;}
"("                    return startingParanthesis;
")"                    return endingParanthesis;
[ \t\n]                ;
";"                    {return yytext[0];}
"+"                    {return AddOp; }
"-"                    {return MinOp; }
"*"                    {return MulOp; }
"^"                    {return ExpOp; }
.                      {ECHO; yyerror ("unexpected character");}

%%
int yywrap (void) {return 1;}

