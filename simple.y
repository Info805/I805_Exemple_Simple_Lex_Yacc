%{
/* code a ajouter dans les declarations c */
#include <stdio.h>

int yylex(void);
void yyerror(char *s);

%}

/* declarations (token, non terminaux, etc.) */
%token VERBE PRONOM ADJECTIF POINT

%%

/* grammaire */
texte:  phrase texte 
        | phrase 
        ; 
phrase: PRONOM VERBE ADJECTIF POINT { printf("OK\n"); } 
        | error POINT 
        ;
%%

/* code c additionnel */
void yyerror(char *s) {
    fprintf(stdout, "%s\n", s);
}