#ifndef _GRAMMARTREE_H
#define _GRAMMARTREE_H

#define MAXSTRING 36
#define VOIDLINE -1

#include<stdio.h>
#include<stdlib.h>
#include<stdarg.h>
#include<string.h>

int gmerror;            // the errors in grammar analyzing

extern char* yytext;
extern FILE* yyin;
extern int yylineno;
extern int yyparse();

typedef struct GrammarTreeNode
{
    int line;       // the number of its line
    char* name;     // the name of this grammar unit
    struct GrammarTreeNode* lchild;
    struct GrammarTreeNode* rchild;
    union           // the value of this grammar unit
    {
        char* string_value;
        int int_value;
        float float_value;
    };
} GrammarTreeNode;

typedef struct GrammarTreeNode* GrammarTree;

/* Create GrammarTree Using Chile-Brother representation
 * name: the name of the grammar unit
 * num: the number of grammar unit in the varible parameter list
*/
GrammarTree CreateGrammarTree(char* name, int num, ...);

/* Traverse GrammarTree Using Pre-Order
 * tree: the grammar tree
 * level: the number of the level
 */
void TraverseGrammerTree(GrammarTree gmtree, int level);

#endif