parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLASSE PROGRAMA LCURLY field_decl* method_decl* RCURLY;

field_decl: type ID (VIRGULA type ID)*  PONTOVIRGULA
	|type ID COLCHETE1 INT COLCHETE2 (VIRGULA type ID COLCHETE1 INT COLCHETE2)* PONTOVIRGULA;


method_decl: (type|VAZIO) ID LPARENT (type ID (VIRGULA type ID)*)? RPARENT block;

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

method_call: method_name LPARENT expr (VIRGULA expr)* RPARENT | SAIR LPARENT STRING (VIRGULA callout_arg)* RPARENT;

method_name: ID;

location: ID|ID COLCHETE1 expr COLCHETE2;

expr: location
      |method_call
      |literal
      |expr bin_op expr
      |NEGATIVO expr
      |EXCLAMACAO expr
      |LPARENT expr RPARENT;

callout_arg: expr | STRING;

bin_op: arith_op|rel_op|eq_op|cond_op;

arith_op: ARITMETICO;

rel_op: RELACIONAMENTO;

eq_op: IGUALDADE;

cond_op: CONDICIONAL;

literal: INT | CHAR2 | bool_literal;


bool_literal: VERDADE | FALSO;









