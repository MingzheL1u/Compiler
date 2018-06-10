%{
    #include<stdio.h>
    #include<stdlib.h>
    #include"GrammarTree.h"
    #include"GrammarTree.tab.h"

    int two_tuples_trigger = 0;  // the trigger controling wether display two-tuples of lexical analyzing

    int yycolumn = 1;
    #define YY_USER_ACTION \
      yylloc.first_line = yylloc.last_line = yylineno; \
      yylloc.first_column = yycolumn; \
      yylloc.last_column = yycolumn + yyleng - 1; \
      yycolumn += yyleng;
%}

%option yylineno

LMSEMICOLON     ";"
LMCOMMA         ","
LMDOT           "."
LMLEFTBRACE     "{"
LMRIGHTBRACE    "}"

OPLEFTPRNT      "("
OPRIGHTPRNT     ")"
OPLEFTBRACKET   "["
OPRIGHTBRACKET  "]"

OPPLUS          "+"
OPMINUS         "-"
OPMULTIPLY      "*"
OPDIVIDE        "/"
OPASSIGN        "="
OPPLUS_         "+="
OPMINUS_        "-="
OPMULTIPLY_     "*="
OPDIVIDE_       "/="

OPINCREASE      "++"
OPDECREASE      "--"

OPAND           "&&"
OPOR            "||"
OPNOT           "!"

OPGREAT         ">"
OPLESS          "<"
OPGREATEQ       ">="
OPLESSEQ        "<="
OPEQUAL         "=="
OPNOTEQUAL      "!="

TYPECHAR        "char"
TYPEINT         "int"
TYPEFLOAT       "float"
TYPEBOOL        "bool"

KEYCLASS        "class"
KEYNEW          "new"
KEYEXTENDS      "extends"

KEYIF           "if"
KEYELSE         "else"
KEYWHILE        "while"
KEYBREAK        "break"

KEYRETURN       "return"

CONSTANTBOOL    "true"|"false"
CONSTANTINTD    [+-]?[0-9]+
CONSTANTINTH    [+-]?0[xX][0-9a-fA-F]+
CONSTANTFLOAT   [+-]?([0-9]*\.?[0-9]+|[0-9]+\.)
CONSTANTFLOATSC [+-]?[0-9]+\.?[0-9]*([eE]{CONSTANTINTD})?
IDENTIFIER      [a-zA-Z_][a-zA-Z0-9_]*
COMMENT         (\/\/.*)|(\/\*((\*[^\/]?)|[^\*]*)*\*\/)
SPACE           " "|\t
EOL             \n

%%
{LMSEMICOLON} {
    if (two_tuples_trigger)
        printf("(%s, LMSEMICOLON)\n", yytext);
    yylval.gTree = CreateGrammarTree("LMSEMICOLON", 0, yylineno);
    return LMSEMICOLON;
}
{LMCOMMA} {
    if (two_tuples_trigger)
        printf("(%s, LMCOMMA)\n", yytext);
    yylval.gTree = CreateGrammarTree("LMCOMMA", 0, yylineno);
    return LMCOMMA;
}
{LMDOT} {
    if (two_tuples_trigger)
        printf("(%s, LMDOT)\n", yytext);
    yylval.gTree = CreateGrammarTree("LMDOT", 0, yylineno);
    return LMDOT;
}
{LMLEFTBRACE} {
    if (two_tuples_trigger)
        printf("(%s, LMLEFTBRACE)\n", yytext);
    yylval.gTree = CreateGrammarTree("LMLEFTBRACE", 0, yylineno);
    return LMLEFTBRACE;
}
{LMRIGHTBRACE} {
    if (two_tuples_trigger)
        printf("(%s, LMRIGHTBRACE)\n", yytext);
    yylval.gTree = CreateGrammarTree("LMRIGHTBRACE", 0, yylineno);
    return LMRIGHTBRACE;
}

{OPPLUS} {
    if (two_tuples_trigger)
        printf("(%s, OPPLUS)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPPLUS", 0, yylineno);
    return OPPLUS;
}
{OPMINUS} {
    if (two_tuples_trigger)
        printf("(%s, OPMINUS)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPMINUS", 0, yylineno);
    return OPMINUS;
}
{OPMULTIPLY} {
    if (two_tuples_trigger)
        printf("(%s, OPMULTIPLY)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPMULTIPLY", 0, yylineno);
    return OPMULTIPLY;
}
{OPDIVIDE} {
    if (two_tuples_trigger)
        printf("(%s, OPDIVIDE)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPDIVIDE", 0, yylineno);
    return OPDIVIDE;
}
{OPASSIGN} {
    if (two_tuples_trigger)
        printf("(%s, OPASSIGN)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPASSIGN", 0, yylineno);
    return OPASSIGN;
}
{OPPLUS_} {
    if (two_tuples_trigger)
        printf("(%s, OPPLUS_)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPPLUS_", 0, yylineno);
    return OPPLUS_;
}
{OPMINUS_} {
    if (two_tuples_trigger)
        printf("(%s, OPMINUS_)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPMINUS_", 0, yylineno);
    return OPMINUS_;
}
{OPMULTIPLY_} {
    if (two_tuples_trigger)
        printf("(%s, OPMULTIPLY_)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPMULTIPLY_", 0, yylineno);
    return OPMULTIPLY_;
}
{OPDIVIDE_} {
    if (two_tuples_trigger)
        printf("(%s, OPDIVIDE_)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPDIVIDE_", 0, yylineno);
    return OPDIVIDE_;
}
{OPINCREASE} {
    if (two_tuples_trigger)
        printf("(%s, OPINCREASE)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPINCREASE", 0, yylineno);
    return OPINCREASE;
}
{OPDECREASE} {
    if (two_tuples_trigger)
        printf("(%s, OPDECREASE)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPDECREASE", 0, yylineno);
    return OPDECREASE;
}
{OPGREAT} {
    if (two_tuples_trigger)
        printf("(%s, OPGREAT)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPGREAT", 0, yylineno);
    return OPGREAT;
}
{OPLESS} {
    if (two_tuples_trigger)
        printf("(%s, OPLESS)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPLESS", 0, yylineno);
    return OPLESS;
}
{OPGREATEQ} {
    if (two_tuples_trigger)
        printf("(%s, OPGREATEQ)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPGREATEQ", 0, yylineno);
    return OPGREATEQ;
}
{OPLESSEQ} {
    if (two_tuples_trigger)
        printf("(%s, OPLESSEQ)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPLESSEQ", 0, yylineno);
    return OPLESSEQ;
}
{OPEQUAL} {
    if (two_tuples_trigger)
        printf("(%s, OPEQUAL)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPEQUAL", 0, yylineno);
    return OPEQUAL;
}
{OPNOTEQUAL} {
    if (two_tuples_trigger)
        printf("(%s, OPNOTEQUAL)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPNOTEQUAL", 0, yylineno);
    return OPNOTEQUAL;
}
{OPAND} {
    if (two_tuples_trigger)
        printf("(%s, OPAND)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPAND", 0, yylineno);
    return OPAND;
}
{OPOR} {
    if (two_tuples_trigger)
        printf("(%s, OPOR)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPOR", 0, yylineno);
    return OPOR;
}
{OPNOT} {
    if (two_tuples_trigger)
        printf("(%s, OPNOT)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPNOT", 0, yylineno);
    return OPNOT;
}
{OPLEFTPRNT} {
    if (two_tuples_trigger)
        printf("(%s, OPLEFTPRNT)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPLEFTPRNT", 0, yylineno);
    return OPLEFTPRNT;
}
{OPRIGHTPRNT} {
    if (two_tuples_trigger)
        printf("(%s, OPRIGHTPRNT)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPRIGHTPRNT", 0, yylineno);
    return OPRIGHTPRNT;
}
{OPLEFTBRACKET} {
    if (two_tuples_trigger)
        printf("(%s, OPLEFTBRACKET)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPLEFTBRACKET", 0, yylineno);
    return OPLEFTBRACKET;
}
{OPRIGHTBRACKET} {
    if (two_tuples_trigger)
        printf("(%s, OPRIGHTBRACKET)\n", yytext);
    yylval.gTree = CreateGrammarTree("OPRIGHTBRACKET", 0, yylineno);
    return OPRIGHTBRACKET;
}

{TYPECHAR} {
    if (two_tuples_trigger)
        printf("(%s, TYPECHAR)\n", yytext);
    yylval.gTree = CreateGrammarTree("TYPECHAR", 0, yylineno);
    return TYPECHAR;
}
{TYPEINT} {
    if (two_tuples_trigger)
        printf("(%s, TYPEINT)\n", yytext);
    yylval.gTree = CreateGrammarTree("TYPEINT", 0, yylineno);
    return TYPEINT;
}
{TYPEFLOAT} {
    if (two_tuples_trigger)
        printf("(%s, TYPEFLOAT)\n", yytext);
    yylval.gTree = CreateGrammarTree("TYPEFLOAT", 0, yylineno);
    return TYPEFLOAT;
}
{TYPEBOOL} {
    if (two_tuples_trigger)
        printf("(%s, TYPEBOOL)\n", yytext);
    yylval.gTree = CreateGrammarTree("TYPEBOOL", 0, yylineno);
    return TYPEBOOL;
}

{KEYCLASS} {
    if (two_tuples_trigger)
        printf("(%s, KEYCLASS)\n", yytext);
    yylval.gTree = CreateGrammarTree("KEYCLASS", 0, yylineno);
    return KEYCLASS;
}
{KEYNEW} {
    if (two_tuples_trigger)
        printf("(%s, KEYNEW)\n", yytext);
    yylval.gTree = CreateGrammarTree("KEYNEW", 0, yylineno);
    return KEYNEW;
}
{KEYEXTENDS} {
    if (two_tuples_trigger)
        printf("(%s, KEYEXTENDS)\n", yytext);
    yylval.gTree = CreateGrammarTree("KEYEXTENDS", 0, yylineno);
    return KEYEXTENDS;
}
{KEYIF} {
    if (two_tuples_trigger)
        printf("(%s, KEYIF)\n", yytext);
    yylval.gTree = CreateGrammarTree("KEYIF", 0, yylineno);
    return KEYIF;
}
{KEYELSE} {
    
    if (two_tuples_trigger)
        printf("(%s, KEYELSE)\n", yytext);
    yylval.gTree = CreateGrammarTree("KEYELSE", 0, yylineno);
    return KEYELSE;
}
{KEYWHILE} {
    if (two_tuples_trigger)
        printf("(%s, KEYWHILE)\n", yytext);
    yylval.gTree = CreateGrammarTree("KEYWHILE", 0, yylineno);
    return KEYWHILE;
}
{KEYBREAK} {
    if (two_tuples_trigger)
        printf("(%s, KEYBREAK)\n", yytext);
    yylval.gTree = CreateGrammarTree("KEYBREAK", 0, yylineno);
    return KEYBREAK;
}
{KEYRETURN} {
    if (two_tuples_trigger)
        printf("(%s, KEYRETURN)\n", yytext);
    yylval.gTree = CreateGrammarTree("KEYRETURN", 0, yylineno);
    return KEYRETURN;
}
{CONSTANTBOOL} {
    if (two_tuples_trigger)
        printf("(%s, CONSTANTBOOL)\n", yytext);
    yylval.gTree = CreateGrammarTree("CONSTANTBOOL", 0, yylineno);
    return CONSTANTBOOL;
}
{CONSTANTINTD} {
    if (two_tuples_trigger)
        printf("(%s, CONSTANTINTD)\n", yytext);
    yylval.gTree = CreateGrammarTree("CONSTANTINTD", 0, yylineno);
    return CONSTANTINTD;
}
{CONSTANTINTH} {
    if (two_tuples_trigger)
        printf("(%s, CONSTANTINTH)\n", yytext);
    yylval.gTree = CreateGrammarTree("CONSTANTINTH", 0, yylineno);
    return CONSTANTINTH;
}
{CONSTANTFLOAT} {
    if (two_tuples_trigger)
        printf("(%s, CONSTANTFLOAT)\n", yytext);
    yylval.gTree = CreateGrammarTree("CONSTANTFLOAT", 0, yylineno);
    return CONSTANTFLOAT;
}
{CONSTANTFLOATSC} {
    if (two_tuples_trigger)
        printf("(%s, CONSTANTFLOATSC)\n", yytext);
    yylval.gTree = CreateGrammarTree("CONSTANTFLOATSC", 0, yylineno);
    return CONSTANTFLOATSC;
}
{IDENTIFIER} {
    if (two_tuples_trigger)
        printf("(%s, IDENTIFIER)\n", yytext);
    yylval.gTree = CreateGrammarTree("IDENTIFIER", 0, yylineno);
    return IDENTIFIER;
}
{COMMENT} {
    if (two_tuples_trigger) 
        printf("(%s, COMMENT)\n", yytext);
}
{SPACE} {
    /*if (two_tuples_trigger) printf("(%s, SPACE)\n", yytext);*/
}
{EOL} {
    if (two_tuples_trigger) printf("(\\n, EOL)\n"); yycolumn = 1;
}

%%
