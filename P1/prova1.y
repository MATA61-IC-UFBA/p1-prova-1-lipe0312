%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token ERROR
%token IDENT NUM STRING
%token PRINT CONCAT LENGTH
%token ASSIGN LPAREN RPAREN COMMA

%left '+' '-'
%left '*' '/'

%start program

%%

/* programa */
program
: stmt_list 
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
: IDENT ASSIGN expr
| PRINT LPAREN exprlist RPAREN
| expr
;

exprlist
: expr
| exprlist COMMA expr
;

expr
: expr '+' expr
| expr '-' expr
| expr '*' expr
| expr '/' expr
| LPAREN expr RPAREN
| NUM
| STRING
| IDENT
| CONCAT LPAREN exprlist RPAREN
| LENGTH LPAREN expr RPAREN
;

%%