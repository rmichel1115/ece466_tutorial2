%{
    //wanted to note, I used some AI/CHAT GPT IN ORDER TO FIX ERRORS WITH CODE
#include <stdio.h>
#include <math.h>
#include <stdlib.h>


int yylex();
void yyerror(const char *s);
int regCnt = 0;

%}

 %union {
  int regno;
  int imm;
}

%token <regno> REG
%token <imm> IMMEDIATE
%token ASSIGN SEMI LPAREN RPAREN LBRACKET RBRACKET MINUS PLUS COMMENT ILLEGAL

%type <regno> expr
//%type <imm> IMMEDIATE //this gave me errors during compiling


%left PLUS MINUS


%% // begin grammar


program:   REG ASSIGN expr SEMI
             { printf("# Output of REG ASSIGN exmpr SEMI\n");
               printf("ADD R%d, R%d, 0\n", $1, $3); }
;




expr:   IMMEDIATE {
        regCnt++;
          printf("# Output of expr: IMMEDIATE\n");
            printf("AND R%d, R%d, 0\n", regCnt, regCnt);
            printf("ADD R%d, R%d, %d\n", regCnt, regCnt, $1);
            $$ = regCnt; }
        | REG {
          $$ = $1; }
        | LPAREN expr RPAREN
          { $$ = $2; }
        | MINUS expr
          { printf("MINUS expr\n"); }
        | LBRACKET expr RBRACKET
          { $$ = $2; }
        | expr PLUS expr
          { printf("# Output of expr: expr PLUS expr\n");
            regCnt++;
            printf("ADD R%d, R%d, R%d\n", regCnt, $1, $3);
            $$ = regCnt; }
        | expr MINUS expr
          { printf("# Output of the expr: expr MINUS expr\n");
            regCnt++;
            printf("SUB R%d, R%d, R%d\n", regCnt, $1, $3);
            $$ = regCnt;  }
;


%% // end grammar

void yyerror(const char *s) {
        printf("Syntax error!\n");
}


int main() {

return yyparse();

}
