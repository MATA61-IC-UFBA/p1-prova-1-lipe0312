%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
%}

%option noyywrap

%%

"//".* {}
[ \t\r\n]+              {}

"print"                 { return PRINT; }
"concat"                { return CONCAT; }
"length"                { return LENGTH; }

[a-zA-Z_][a-zA-Z0-9_]* { return IDENT; }
[0-9]+                  { return NUM; }

\"[^\"\n]*\"            { return STRING; }

"="                     { return ASSIGN; }
"("                     { return LPAREN; }
")"                     { return RPAREN; }
","                     { return COMMA; }

"+"                     { return '+'; }
"-"                     { return '-'; }
"*"                     { return '*'; }
"/"                     { return '/'; }

.                       { return ERROR; }

%%