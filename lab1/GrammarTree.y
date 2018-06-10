%{
    #include<stdio.h>
    #include<unistd.h>
    #include"GrammarTree.h"
    #include"lex.yy.c"
    void yyerror(const char* fmt, ...);
%}

%error-verbose
%locations

%union {
    GrammarTree gTree;
}

%token <gTree> LMSEMICOLON LMCOMMA LMDOT LMLEFTBRACE LMRIGHTBRACE
%token <gTree> OPLEFTPRNT OPRIGHTPRNT OPLEFTBRACKET OPRIGHTBRACKET
%token <gTree> OPPLUS OPMINUS OPMULTIPLY OPDIVIDE OPASSIGN OPPLUS_ OPMINUS_ OPMULTIPLY_ OPDIVIDE_ 
%token <gTree> OPINCREASE OPDECREASE
%token <gTree> OPAND OPOR OPNOT
%token <gTree> OPGREAT OPLESS OPGREATEQ OPLESSEQ OPEQUAL OPNOTEQUAL
%token <gTree> TYPECHAR TYPEINT TYPEFLOAT TYPEBOOL
%token <gTree> KEYCLASS KEYNEW KEYEXTENDS
%token <gTree> KEYIF KEYELSE KEYWHILE KEYBREAK
%token <gTree> KEYRETURN
%token <gTree> CONSTANTINTD CONSTANTINTH CONSTANTFLOAT CONSTANTFLOATSC CONSTANTBOOL IDENTIFIER

%type <gTree> Program ClassDefs VariableDef CommaIdentifiers Variable Type Variables Formals FunctionDef ClassDef Fields Field StmtBlock Stmts Stmt SimpleStmt LValue Call Actuals Exprs WhileStmt IfStmt ReturnStmt BreakStmt BoolExpr Expr Constant

%right OPASSIGN OPPLUS_ OPMINUS_ OPMULTIPLY_ OPDIVIDE_ 
%left OPOR
%left OPAND
%left OPNOTEQUAL
%left OPGREAT OPLESS OPGREATEQ OPLESSEQ OPEQUAL
%left OPPLUS OPMINUS
%left OPMULTIPLY OPDIVIDE
%right OPNOT
%left LMDOT
%left OPRIGHTBRACKET
%right OPLEFTBRACKET
%left OPRIGHTPRNT
%right OPLEFTPRNT

%nonassoc LOWER_THAN_ELSE
%nonassoc KEYELSE

%%
Program: ClassDefs {
        $$ = CreateGrammarTree("Program", 1, $1);
        if (two_tuples_trigger){
            printf("__________________________________________________\n\n");
            printf("The two-tuples of \"Lexical Analyzing\" are printed!\n");
            printf("__________________________________________________\n");
        }
        if (!gmerror){
            printf("\nNow print the grammar-tree of \"Grammar Analyzing\":\n");
            printf("__________________________________________________\n\n"); 
            TraverseGrammerTree($$, 0);
            printf("__________________________________________________\n\n"); 
            printf("The grammar-tree of \"Grammar Analyzing\" is printed!\n\n"); 
        }
        }
        ;

ClassDefs: ClassDef{ $$ = CreateGrammarTree("ClassDefs", 1, $1);}
        |  ClassDefs ClassDef { $$ = CreateGrammarTree("ClassDefs", 2, $1, $2); }
        ;

VariableDef: Variable LMSEMICOLON { $$ = CreateGrammarTree("VariableDef", 2, $1, $2); }
           | Variable CommaIdentifiers LMSEMICOLON { $$ = CreateGrammarTree("VariableDef", 3, $1, $2, $3); } 
           | error LMSEMICOLON { $$ = CreateGrammarTree("VariableDef", 1, $2); gmerror += 1; }
           ;

CommaIdentifiers: LMCOMMA IDENTIFIER { $$ = CreateGrammarTree("CommaIdentifiers", 2, $1, $2); } 
                | CommaIdentifiers LMCOMMA IDENTIFIER { $$ = CreateGrammarTree("CommaIdentifiers", 3, $1, $2, $3); } 
                ;

Variable: Type IDENTIFIER { $$ = CreateGrammarTree("Variable", 2, $1, $2); }
        ;
 
Type: TYPEINT { $$ = CreateGrammarTree("Type", 1, $1); }
    | TYPEFLOAT { $$ = CreateGrammarTree("Type", 1, $1); }
    | TYPEBOOL { $$ = CreateGrammarTree("Type", 1, $1); }
    | TYPECHAR { $$ = CreateGrammarTree("Type", 1, $1); }
    | KEYCLASS IDENTIFIER { $$ = CreateGrammarTree("Type", 2, $1, $2); }
    | Type OPLEFTBRACKET OPRIGHTBRACKET { $$ = CreateGrammarTree("Type", 3, $1, $2, $3); }
    ;

Variables: Variable { $$ = CreateGrammarTree("Variables", 1, $1); }
         | Variables LMCOMMA Variable { $$ = CreateGrammarTree("Variables", 3, $1, $2, $3); }
         ;

Formals: { $$ = CreateGrammarTree("Formals", 0, -1); }
       | Variables { $$ = CreateGrammarTree("Formals", 1, $1); }
       ;

FunctionDef: Type IDENTIFIER OPLEFTPRNT Formals OPRIGHTPRNT StmtBlock { $$ = CreateGrammarTree("FunctionDef", 6, $1, $2, $3, $4, $5, $6); }
           ;

ClassDef: KEYCLASS IDENTIFIER LMLEFTBRACE Fields LMRIGHTBRACE { $$ = CreateGrammarTree("ClassDef", 5, $1, $2, $3, $4, $5); }
        | KEYCLASS IDENTIFIER KEYEXTENDS IDENTIFIER LMLEFTBRACE Fields LMRIGHTBRACE { $$ = CreateGrammarTree("ClassDef", 7, $1, $2, $3, $4, $5, $6, $7); }
        | error LMRIGHTBRACE { $$ = CreateGrammarTree("ClassDef", 1, $2); gmerror += 1; }
        ;

Fields: { $$ = CreateGrammarTree("Fields", 0, -1); }
      | Field Fields { $$ = CreateGrammarTree("Fields", 2, $1, $2); }
      ;

Field: VariableDef { $$ = CreateGrammarTree("Field", 1, $1); }
     | FunctionDef { $$ = CreateGrammarTree("Field", 1, $1); }
     ;

StmtBlock: LMLEFTBRACE Stmts LMRIGHTBRACE { $$ = CreateGrammarTree("StmtBlock", 3, $1, $2, $3); }
         | error LMRIGHTBRACE { $$ = CreateGrammarTree("StmtBlock", 1, $2); gmerror += 1; }
         ;

Stmts: { $$ = CreateGrammarTree("Stmts", 0, -1); }
     | Stmt Stmts { $$ = CreateGrammarTree("Stmts", 2, $1, $2); }
     ;

Stmt: VariableDef { $$ = CreateGrammarTree("Stmt", 1, $1); }
    | SimpleStmt LMSEMICOLON { $$ = CreateGrammarTree("Stmt", 2, $1, $2); }
    | IfStmt { $$ = CreateGrammarTree("Stmt", 1, $1); }
    | WhileStmt { $$ = CreateGrammarTree("Stmt", 1, $1); }
    | BreakStmt LMSEMICOLON { $$ = CreateGrammarTree("Stmt", 2, $1, $2); }
    | ReturnStmt LMSEMICOLON { $$ = CreateGrammarTree("Stmt", 2, $1, $2); }
    | StmtBlock { $$ = CreateGrammarTree("Stmt", 1, $1); }
    ;

SimpleStmt: { $$ = CreateGrammarTree("SimpleStmt", 0, -1); } 
          | LValue OPASSIGN Expr { $$ = CreateGrammarTree("SimpleStmt", 3, $1, $2, $3); } 
          | LValue OPPLUS_ Expr { $$ = CreateGrammarTree("SimpleStmt", 3, $1, $2, $3); } 
          | LValue OPMINUS_ Expr { $$ = CreateGrammarTree("SimpleStmt", 3, $1, $2, $3); } 
          | LValue OPMULTIPLY_ Expr { $$ = CreateGrammarTree("SimpleStmt", 3, $1, $2, $3); } 
          | LValue OPDIVIDE_ Expr { $$ = CreateGrammarTree("SimpleStmt", 3, $1, $2, $3); } 
          | OPINCREASE IDENTIFIER { $$ = CreateGrammarTree("SimpleStmt", 2, $1, $2); }
          | OPDECREASE IDENTIFIER { $$ = CreateGrammarTree("SimpleStmt", 2, $1, $2); }
          | Call { $$ = CreateGrammarTree("SimpleStmt", 1, $1); } 
          ;

LValue: IDENTIFIER { $$ = CreateGrammarTree("LValue", 1, $1); }  
      | Expr LMDOT IDENTIFIER { $$ = CreateGrammarTree("LValue", 3, $1, $2, $3); }  
      | Expr OPLEFTBRACKET Expr OPRIGHTBRACKET { $$ = CreateGrammarTree("LValue", 4, $1, $2, $3, $4); }  
      ;

Call: IDENTIFIER OPLEFTPRNT Actuals OPRIGHTPRNT { $$ = CreateGrammarTree("Call", 4, $1, $2, $3, $4); }  
    | Expr LMDOT IDENTIFIER OPLEFTPRNT Actuals OPRIGHTPRNT { $$ = CreateGrammarTree("Call", 6, $1, $2, $3, $4, $5, $6); }  
    ;

Actuals: { $$ = CreateGrammarTree("Actuals", 0, -1); }
       | Exprs { $$ = CreateGrammarTree("Actuals", 1, $1); }

Exprs: Expr { $$ = CreateGrammarTree("Exprs", 1, $1); }
     | Exprs LMCOMMA Expr { $$ = CreateGrammarTree("Exprs", 3, $1, $2, $3); }
     ;

WhileStmt: KEYWHILE OPLEFTPRNT BoolExpr OPRIGHTPRNT Stmt { $$ = CreateGrammarTree("WhileStmt", 5, $1, $2, $3, $4, $5); }  
         ;

IfStmt: KEYIF OPLEFTPRNT BoolExpr OPRIGHTPRNT Stmt %prec LOWER_THAN_ELSE { $$ = CreateGrammarTree("IfStmt", 5, $1, $2, $3, $4, $5); }  
      | KEYIF OPLEFTPRNT BoolExpr OPRIGHTPRNT Stmt KEYELSE Stmt { $$ = CreateGrammarTree("IfStmt", 7, $1, $2, $3, $4, $5, $6, $7); }  
      ;

ReturnStmt: KEYRETURN { $$ = CreateGrammarTree("ReturnStmt", 1, $1); }
          | KEYRETURN Expr { $$ = CreateGrammarTree("ReturnStmt", 2, $1, $2); } 
          ;

BreakStmt: KEYBREAK { $$ = CreateGrammarTree("BreakStmt", 1, $1); }
         ;

BoolExpr: Expr { $$ = CreateGrammarTree("BoolExpr", 1, $1); }
        ;

Expr: Constant { $$ = CreateGrammarTree("Expr", 1, $1); }
    | LValue { $$ = CreateGrammarTree("Expr", 1, $1); }
    | Call { $$ = CreateGrammarTree("Expr", 1, $1); }
    | OPLEFTPRNT Expr OPRIGHTPRNT { $$ = CreateGrammarTree("Expr", 3, $1, $2, $3); }
    | Expr OPPLUS Expr { $$ = CreateGrammarTree("Expr", 3, $1, $2, $3); }
    | Expr OPMINUS Expr { $$ = CreateGrammarTree("Expr", 3, $1, $2, $3); }
    | Expr OPMULTIPLY Expr { $$ = CreateGrammarTree("Expr", 3, $1, $2, $3); }
    | Expr OPDIVIDE Expr { $$ = CreateGrammarTree("Expr", 3, $1, $2, $3); }
    | OPMINUS Expr { $$ = CreateGrammarTree("Expr", 2, $1, $2); }
    | Expr OPLESS Expr { $$ = CreateGrammarTree("Expr", 3, $1, $2, $3); }
    | Expr OPLESSEQ Expr { $$ = CreateGrammarTree("Expr", 3, $1, $2, $3); }
    | Expr OPGREAT Expr { $$ = CreateGrammarTree("Expr", 3, $1, $2, $3); }
    | Expr OPGREATEQ Expr { $$ = CreateGrammarTree("Expr", 3, $1, $2, $3); }
    | Expr OPEQUAL Expr { $$ = CreateGrammarTree("Expr", 3, $1, $2, $3); }
    | Expr OPNOTEQUAL Expr { $$ = CreateGrammarTree("Expr", 3, $1, $2, $3); }
    | Expr OPAND Expr { $$ = CreateGrammarTree("Expr", 3, $1, $2, $3); }
    | Expr OPOR Expr { $$ = CreateGrammarTree("Expr", 3, $1, $2, $3); }
    | OPNOT Expr { $$ = CreateGrammarTree("Expr", 2, $1, $2); }
    | KEYNEW IDENTIFIER OPLEFTPRNT OPRIGHTPRNT { $$ = CreateGrammarTree("Expr", 4, $1, $2, $3, $4); }
    | KEYNEW Type OPLEFTBRACKET Expr OPRIGHTBRACKET { $$ = CreateGrammarTree("Expr", 5, $1, $2, $3, $4, $5); }
    | OPLEFTPRNT KEYCLASS IDENTIFIER OPRIGHTPRNT Expr { $$ = CreateGrammarTree("Expr", 5, $1, $2, $3, $4, $5); }
    ;

Constant: CONSTANTINTD { $$ = CreateGrammarTree("Constant", 1, $1); }
        | CONSTANTINTH { $$ = CreateGrammarTree("Constant", 1, $1); }
        | CONSTANTFLOAT { $$ = CreateGrammarTree("Constant", 1, $1); }
        | CONSTANTFLOATSC { $$ = CreateGrammarTree("Constant", 1, $1); }
        | CONSTANTBOOL { $$ = CreateGrammarTree("Constant", 1, $1); }
        ;

%%

#include<stdarg.h>

void yyerror(const char* fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);
    fprintf(stderr, "Error type B at Line %d Column %d: ", yylineno, yylloc.first_column);
    vfprintf(stderr, fmt, ap);
    fprintf(stderr, ".\n");
}