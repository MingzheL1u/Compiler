%{
    #include "lex.yy.c"
}%

%error-verbose
%locations

%union {
    GrammarTree gTree;
}

%token <gTree> LMSEMICOLON LMCOMMA LMDOT LMLEFTBRAE LMRIGHTBRACE
%token <gTree> OPLEFTPRNT OPRIGHTPRNT OPLEFTBRACKET OPRIGHTBRACKET
%token <gTree> OPPLUS OPMINUS OPMULTIPLY OPDIVIDE OPASSIGN OPPLUS_ OPMINUS_ OPMULTIPLY_ OPDIVIDE_ 
%token <gTree> OPINCREASE OPDECREASE
%token <gTree> OPAND OPOR OPNOT
%token <gTree> OPGREAT OPLESS OPGREATEQ OPLESSEQ OPEQUAL OPNOTEQUAL
%token <gTree> TYPECHAR TYPEINT TYPEFLOAT
%token <gTree> KEYCLASS KEYNEW KEYEXTENDS
%token <gTree> KEYIF KEYELSE KEYWHILE KEYBREAK
%token <gTree> KEYRETURN
%token <gTree> CONSTANTINTD CONSTANTINTH CONSTANTFLOAT CONSTANTFLOATSC IDENTIFIER COMMENT

%type <gTree> Program ClassDefs VariableDef CommaIdentifiers Variable Type Variables Formals FunctionDef ClassDef Fields Field StmtBlock Stmts Stmt SimpleStmt LValue Call Actuals Exprs ForStmt WhileStmt IfStmt ReturnStmt BreakStmt PrintStmt BoolExpr Expr Constant

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



 VariableDef CommaIdentifiers Variable Type Variables Formals FunctionDef ClassDef Fields Field StmtBlock Stmts Stmt SimpleStmt LValue Call Actuals Exprs ForStmt WhileStmt IfStmt ReturnStmt BreakStmt PrintStmt BoolExpr Expr Constant

