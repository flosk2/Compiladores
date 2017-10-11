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

var_decl: type ID (VIRGULA type ID)* PONTOVIRGULA;

type: INTEIRO|BOOLEANO;

statement: location assign_op expr PONTOVIRGULA
	   | method_call PONTOVIRGULA
	   | SE LPARENT expr RPARENT block (SENAO block)?
	   | VA ID assign_op expr VIRGULA expr block 
	   | RETORNO (expr)? PONTOVIRGULA
	   | QUEBRA PONTOVIRGULA 
	   | CONTINUAR PONTOVIRGULA
	   | block ;

assign_op: OPDIVERSOS;

method_call: method_name LPARENT expr (VIRGULA expr)* RPARENT | SAIR LPARENT string_literal (VIRGULA callout_arg)* RPARENT;

method_name: id;

location: id|id COLCHETE1 expr COLCHETE2;

expr: location
      |method_call
      |literal
      |expr bin_op expr
      |NEGATIVO expr
      |EXCLAMACAO expr
      |LPARENT expr RPARENT;

callout_arg: expr | string_literal;

bin_op: arith_op|rel_op|eq_op|cond_op;

arith_op: ARITMETICO;

rel_op: RELACIONAMENTO;

eq_op: IGUALDADE;

cond_op: CONDICIONAL;

literal: int_literal | char_literal | bool_literal;

id: ID;

hex_digit: DIGITOHEX;

int_literal: INT;

bool_literal: VERDADE | FALSO;

char_literal: CHAR2;

string_literal: STRING;






