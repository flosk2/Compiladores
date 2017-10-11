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

}


TK_class: 'class Program'; 

LCURLY : '{';
RCURLY : '}';

LPARENT : '(';
RPARENT : ')';




PONTOVIRGULA : ';';

VIRGULA: ',';

BOOLEANO : 'boolean';
SAIR : 'callout';
CLASSE : 'class';
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

OP: ARIT|IGUA|COND|REL;

ARITMETICO: ARIT;
IGUALDADE: IGUA;
CONDICIONAL : COND;
RELACIONAMENTO: REL;
OPDIVERSOS: A_SING;

FORIGUAL: ATRIBFOR;

fragment ARIT: ('+'|'-'|'*'|'/'|'%');
fragment IGUA: ('=='|'!=');
fragment REL: ('>'|'<'|'>='|'<='|'/');
fragment COND: ('&&'|'||'); 
fragment ATRIBFOR: '=';
fragment A_SING: (ATRIBFOR|'+='|'-=');


NEGATIVO: '-';

HEX: '0x' (HEX_DIGIT)+;

DIGITOHEX: HEX_DIGIT;

fragment HEX_DIGIT: [0-9a-fA-F];

INT: HEX | NUMBER;

fragment NUMBER: '0'..'9'+;

STRING :'"' ('a'..'z'|'A'..'Z'|'0'..'9'|ASC|ESC|' ' )+ '"';

SINAIS: '-';

WS_ :(' ' | '\n' ) -> skip;

SL_COMMENT :'//' (~'\n')* '\n' -> skip;
CHAR2 :'\''('A'..'Z'|'a'..'z'|'0'..'9'|ESC|ASC)'\'';

COLCHETE1 :'[';
COLCHETE2 :']';

LETRASDIGITOS: LETTER_OR_DIGIT;


BARRAS :'\n' '\t' '\\' '\"';

TK: ','|'!'|'#'|'$'|'%'|'&'|'('|')'|'*'|'+'|'-'|'/'|':'|';'|'<'|'='|'@'|'>'|'['|']'|'{'|'}'|'^'|'_'|'`'|'|'|'~';

ID : LETTER LETTER_OR_DIGIT*;

GATO : '0x';


fragment LETTER: [a-zA-Z_];
fragment LETTER_OR_DIGIT: [a-zA-Z_0-9];

fragment ESC :'\\' ('n'|'"'|'t'|'\''|'\\');

fragment ASC :','|'?'|'!'|'#'|'$'|'%'|'&'|'('|')'|'*'|'+'|'-'|'.'|'/'|':'|';'|'<'|'='|'@'|'>'|'['|']'|'{'|'}'|'^'|'_'|'`'|'|'|'~';


