%{
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

KEYCLASS        "class"
KEYNEW          "new"
KEYEXTENDS      "extends"

KEYIF           "if"
KEYELSE         "else"
KEYWHILE        "while"
KEYBREAK        "break"

KEYRETURN       "return"

CONSTANTINTD     [+-]?[0-9]+
CONSTANTINTH    [+-]?0[xX][0-9a-fA-F]+
CONSTANTFLOAT   [+-]?([0-9]*\.?[0-9]+|[0-9]+\.)
CONSTANTFLOATSC [+-]?[0-9]+\.?[0-9]*([eE]{CONSTANTINTD})?
IDENTIFIER      [a-zA-Z_][a-zA-Z0-9_]*
COMMENT         (\/\/.*)|(\/\*((\*[^\/]?)|[^\*]*)*\*\/)
SPACE           " "|\t
EOL             \n

%%
{LMSEMICOLON} {
    printf("(%s, LMSEMICOLON)\n", yytext);
}
{LMCOMMA} {
    printf("(%s, LMCOMMA)\n", yytext);
}
{LMDOT} {
    printf("(%s, LMDOT)\n", yytext);
}
{LMLEFTBRACE} {
    printf("(%s, LMLEFTBRACE)\n", yytext);
}
{LMRIGHTBRACE} {
    printf("(%s, LMRIGHTBRACE)\n", yytext);
}

{OPPLUS} {
    printf("(%s, OPPLUS)\n", yytext);
}
{OPMINUS} {
    printf("(%s, OPMINUS)\n", yytext);
}
{OPMULTIPLY} {
    printf("(%s, OPMULTIPLY)\n", yytext);
}
{OPDIVIDE} {
    printf("(%s, OPDIVIDE)\n", yytext);
}
{OPASSIGN} {
    printf("(%s, OPASSIGN)\n", yytext);
}
{OPPLUS_} {
    printf("(%s, OPPLUS_)\n", yytext);
}
{OPMINUS_} {
    printf("(%s, OPMINUS_)\n", yytext);
}
{OPMULTIPLY_} {
    printf("(%s, OPMULTIPLY_)\n", yytext);
}
{OPDIVIDE_} {
    printf("(%s, OPDIVIDE_)\n", yytext);
}
{OPINCREASE} {
    printf("(%s, OPINCREASE)\n", yytext);
}
{OPDECREASE} {
    printf("(%s, OPDECREASE)\n", yytext);
}
{OPGREAT} {
    printf("(%s, OPGREAT)\n", yytext);
}
{OPLESS} {
    printf("(%s, OPLESS)\n", yytext);
}
{OPGREATEQ} {
    printf("(%s, OPGREATEQ)\n", yytext);
}
{OPLESSEQ} {
    printf("(%s, OPLESSEQ)\n", yytext);
}
{OPEQUAL} {
    printf("(%s, OPEQUAL)\n", yytext);
}
{OPNOTEQUAL} {
    printf("(%s, OPNOTEQUAL)\n", yytext);
}
{OPAND} {
    printf("(%s, OPAND)\n", yytext);
}
{OPOR} {
    printf("(%s, OPOR)\n", yytext);
}
{OPNOT} {
    printf("(%s, OPNOT)\n", yytext);
}
{OPLEFTPRNT} {
    printf("(%s, OPLEFTPRNT)\n", yytext);
}
{OPRIGHTPRNT} {
    printf("(%s, OPRIGHTPRNT)\n", yytext);
}
{OPLEFTBRACKET} {
    printf("(%s, OPLEFTBRACKET)\n", yytext);
}
{OPRIGHTBRACKET} {
    printf("(%s, OPRIGHTBRACKET)\n", yytext);
}

{TYPECHAR} {
    printf("(%s, TYPECHAR)\n", yytext);
}
{TYPEINT} {
    printf("(%s, TYPEINT)\n", yytext);
}
{TYPEFLOAT} {
    printf("(%s, TYPEFLOAT)\n", yytext);
}

{KEYCLASS} {
    printf("(%s, KEYCLASS)\n", yytext);
}
{KEYNEW} {
    printf("(%s, KEYNEW)\n", yytext);
}
{KEYEXTENDS} {
    printf("(%s, KEYEXTENDS)\n", yytext);
}
{KEYIF} {
    printf("(%s, KEYIF)\n", yytext);
}
{KEYELSE} {
    printf("(%s, KEYELSE)\n", yytext);
}
{KEYWHILE} {
    printf("(%s, KEYWHILE)\n", yytext);
}
{KEYBREAK} {
    printf("(%s, KEYBREAK)\n", yytext);
}
{KEYRETURN} {
    printf("(%s, KEYRETURN)\n", yytext);
}
{CONSTANTINTD} {
    printf("(%s, CONSTANTINTD)\n", yytext);
}
{CONSTANTINTH} {
    printf("(%s, CONSTANTINTH)\n", yytext);
}
{CONSTANTFLOAT} {
    printf("(%s, CONSTANTFLOAT)\n", yytext);
}
{CONSTANTFLOATSC} {
    printf("(%s, CONSTANTFLOATSC)\n", yytext);
}
{IDENTIFIER} {
    printf("(%s, IDENTIFIER)\n", yytext);
}
{COMMENT} {

}
{SPACE} {

}
{EOL} {

}

%%
