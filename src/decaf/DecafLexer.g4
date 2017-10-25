lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
TK_class
}



 

NEGATIVO: '-';
SOMA: '+';
MULTIPLICACAO: '*';
DIVISAO: '/';
PORCENTAGEM: '%';


ARITMETICO: NEGATIVO|SOMA|MULTIPLICACAO|DIVISAO|PORCENTAGEM;
IGUALDADE: IGUALDUPLO|DIFERENTE;
RELACIONAMENTO: MAIOR|MENOR|MAIORIGUAL|MENORIGUAL;
CONDICIONAL: EDUPLO|OUDUPLO;
OPDIVERSOS: IGUAL|MAISIGUAL|MENOSIGUAL;

LCURLY : '{';
RCURLY : '}';

LPARENT : '(';
RPARENT : ')';

OP: ARITMETICO|IGUALDADE|CONDICIONAL|RELACIONAMENTO;

IGUALDUPLO: '==';
DIFERENTE: '!=';
MAIOR: '>';
MENOR: '<';
MAIORIGUAL: '>=';
MENORIGUAL: '<=';
EDUPLO: '&&';
OUDUPLO: '||';
IGUAL: '=';
MAISIGUAL: '+=';
MENOSIGUAL: '-=';



PONTOVIRGULA : ';';

VIRGULA: ',';

BOOLEANO : 'boolean';
SAIR : 'callout';
CLASSE : 'class';
PROGRAMA: 'Program';
SENAO : 'else';
FALSO : 'false';
SE : 'if';
INTEIRO : 'int';
RETORNO : 'return';
VERDADE: 'true';
VAZIO : 'void';
VA : 'for';
PARDEFOR: 'forpar';
QUEBRA : 'break';
CONTINUAR : 'continue';
 
EXCLAMACAO: '!';




INT: HEX | NUMBER;

HEX: '0x' (HEX_DIGIT)+;


fragment HEX_DIGIT: [0-9a-fA-F];



fragment NUMBER: '0'..'9'+;

STRING :'"' ('a'..'z'|'A'..'Z'|'0'..'9'|ASC|ESC|' ' )+ '"';


WS_ :(' ' | '\n'|'\t'|'\r' ) -> skip;

SL_COMMENT :'//' (~'\n')* '\n' -> skip;
CHAR2 :'\''('A'..'Z'|'a'..'z'|'0'..'9'|ESC|ASC)'\'';

COLCHETE1 :'[';
COLCHETE2 :']';



//BARRAS :'\n' '\t' '\\' '\"';



ID : LETTER (LETTER_OR_DIGIT)*;

GATO : '0x';


fragment LETTER: [a-zA-Z_];
fragment LETTER_OR_DIGIT: [a-zA-Z_0-9];

fragment ESC :'\\' ('n'|'"'|'t'|'\''|'\\');

fragment ASC :','|'?'|'!'|'#'|'$'|'%'|'&'|'('|')'|'*'|'-'|'+'|'.'|'/'|':'|';'|'<'|'='|'@'|'>'|'['|']'|'{'|'}'|'^'|'_'|'`'|'|'|'~';


