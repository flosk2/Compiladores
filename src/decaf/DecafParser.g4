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

field_decl: ((type id | type id COLCHETE1 int_literal COLCHETE2)(VIRGULA type id | type id COLCHETE1 int_literal COLCHETE2)*) PONTOVIRGULA;

method_decl: (type|VAZIO) id LPARENT (type id(VIRGULA type id)+)? RPARENT block;

block:  LCURLY  var_decl* statement*  RCURLY;

var_decl: (type id(VIRGULA type id)*) PONTOVIRGULA;

type: INTEIRO|BOOLEANO;

statement: location assign_op expr PONTOVIRGULA
	   | method_call PONTOVIRGULA
	   | SE LPARENT expr RPARENT block | (SENAO block)?
	   | VA LPARENT id ATRIBFOR expr PONTOVIRGULA expr PONTOVIRGULA block RPARENT
	   | RETORNO (expr)? PONTOVIRGULA
	   | QUEBRA PONTOVIRGULA
	   | CONTINUAR PONTOVIRGULA
	   | block ;
assign_op: OPDIVERSOS;
method_call: method_name LPARENTexpr(VIRGULA expr)*RPARENT | SAIR LPARENT string_literal(VIRGULA callout_arg)* RPARENT;
