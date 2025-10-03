%{
#include "calc.tab.h"
#include <string.h>


char* yytext_ptr;
%}

DIGIT [0-9]
NUMBER ({DIGIT}+(\.{DIGIT}*)?|\.{DIGIT}+)

%%
[ \t]                  ; /* ignore whitespace */
\n                     {yylval.string = strdup(yytext);return EOL;}

"="                    {yylval.string = strdup(yytext);return ASSIGN;}
"+"                    {yylval.string = strdup(yytext);return PLUS;}
"-"                    {yylval.string = strdup(yytext);return MINUS;}
"*"                    {yylval.string = strdup(yytext);return TIMES;}
"/"                    {yylval.string = strdup(yytext);return DIVIDE;}
"^"                    {yylval.string = strdup(yytext);return POWER;}
"%"                    {yylval.string = strdup(yytext);return MODULO;}
"neg("                 {yylval.string = strdup(yytext);return NEG;}
"abs("                 {yylval.string = strdup(yytext);return ABS;}
"cos("                 {yylval.string = strdup(yytext);return COS;}
"sin("                 {yylval.string = strdup(yytext);return SIN;}
"log("                 {yylval.string = strdup(yytext);return LOG;}
"++"                   {yylval.string = strdup(yytext);return INC;}
"--"                   {yylval.string = strdup(yytext);return DEC;}
"("                    {yylval.string = strdup(yytext);return LPAREN;}
")"                    {yylval.string = strdup(yytext);return RPAREN;}
{NUMBER}               { yylval.number = atof(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.string = strdup(yytext); return VARIABLE; }
.                      {yylval.string = strdup(yytext);return yytext[0];}
%%

int yywrap() {
    return 1;
}
