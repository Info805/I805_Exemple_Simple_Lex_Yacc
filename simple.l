/* code a ajouter dans les declarations c */
%{
#include "simple.tab.h"
%}

/* lex options */
%option noyywrap

/* definitions regulieres */
il         "Il"|"il"
elle       "Elle"|"elle" 
pronom     {il}|{elle}
verbe      "est"|"boit"
adj        "vite"|"beau"|"belle"|"bien"|"chaud"
sep        [[:space:]]
point      [.?!;]

%%

  /* ------------------------Section des Regles Lexicales----------------------*/

  /* regles */
{sep}+          { /* pas d'action */ }
{pronom}        { return PRONOM;     }
{verbe}         { return VERBE;      }
{adj}           { return ADJECTIF;   }
{point}         { return POINT;      }
.               { return *yytext;    }

%%
/* code c additionnel */
int main(int argc, char* argv[]){
    if (argc > 1){
        yyin = fopen(argv[1], "r");
    } else {
    yyin = stdin;
    }
    int res = yyparse();
    return res;
}