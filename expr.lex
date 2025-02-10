%{
//wanted to note, I used some AI/CHAT GPT IN ORDER TO FIX ERRORS WITH CODE
    #include <stdio.h>
    #include <math.h>

    #include "expr.tab.h"

    extern YYSTYPE yylval;

%}

%option noyywrap
%option debug



%% // begin tokens

[Rr][0-7]  { yylval.reg = atoi(yytext+1); return REG; }
[0-9]+  { yylval.imm = atoi(yytext); return IMMEDIATE; }
"=" { return ASSIGN; }
";" { return SEMI; }
"(" { return LPAREN; }
")" { return RPAREN; }
"[" { return LBRACKET; }
"]" { return RBRACKET; }
"-"        { return MINUS; }
"+"        { return PLUS; }
"//".*     { /* Ignore comments */ }
[ \t\n]    { /* Ignore whitespace */ }



%% // end tokens



//int main(int argc, char *argv[])
//{
  //yylex();
  //return 0;
//}
