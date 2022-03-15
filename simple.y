%{
#include <stdio.h>

int yylex(void);
void yyerror(char *s);

%}

%token VERBE PRONOM ADJECTIF POINT
terminal ERROR;


%%

/* grammaire */
texte:  phrase texte 
        | phrase 
        ; 
phrase: PRONOM VERBE ADJECTIF POINT { printf("OK\n"); } 
        | error POINT 
        ;
%%

void yyerror(char *s) {
    fprintf(stdout, "%s\n", s);
}