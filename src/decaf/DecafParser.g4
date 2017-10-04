parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: TK_class LCURLY field_decl* method_decl* RCURLY EOF;
field_decl: (type id | type id CHAVE1 int_literal CHAVE2)+,PONTOVIRGULA
method_decl: (type|VAZIO) id LPARENT RPARENT 


