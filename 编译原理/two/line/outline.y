%{
/****************************************************************************
outline.y
ParserWizard generated YACC file.

Date: 2023��4��21��
****************************************************************************/

#include "outline.h"
%}

/////////////////////////////////////////////////////////////////////////////
// declarations section

// attribute type
%include {
#ifndef YYSTYPE
#define YYSTYPE int
#endif
}

// place any declarations here

%%

/////////////////////////////////////////////////////////////////////////////
// rules section

// place your YACC rules here (there must be at least one)

Grammar
	: /* empty */
	;

%%

/////////////////////////////////////////////////////////////////////////////
// programs section

int main(void)
{
	return yyparse();
}

