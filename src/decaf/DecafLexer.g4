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



LCURLY : '{';
RCURLY : '}';



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
 

OP: '+'|'-'|'*'|'<'|'<='|'!='|'&&';

HEX: '0x' (HEX_DIGIT)+;

fragment HEX_DIGIT: [0-9a-fA-F];

INT: HEX | NUMBER;

fragment NUMBER: '0'..'9'+;

STRING :'"' ('a'..'z'|'A'..'Z'|'0'..'9'|ASC|ESC|' ' )+ '"';

SINAIS: '-';

WS_ :(' ' | '\n' ) -> skip;

SL_COMMENT :'//' (~'\n')* '\n' -> skip;
CHAR2 :'\''('A'..'Z'|'a'..'z'|'0'..'9'|ESC|ASC)'\'';



BARRAS :'\n' '\t' '\\' '\"';

//GATO : '0x';



TK: ','|'?'|'!'|'#'|'$'|'%'|'&'|'('|')'|'*'|'+'|'-'|'/'|':'|';'|'<'|'='|'@'|'>'|'['|']'|'{'|'}'|'^'|'_'|'`'|'|'|'~';

ID : (~'.')(~'0'..'9') LETTER LETTER_OR_DIGIT*;

fragment LETTER: [a-zA-Z_];
fragment LETTER_OR_DIGIT: [a-zA-Z_0-9];

fragment ESC :'\\' ('n'|'"'|'t'|'\''|'\\');

fragment ASC :','|'?'|'!'|'#'|'$'|'%'|'&'|'('|')'|'*'|'+'|'-'|'.'|'/'|':'|';'|'<'|'='|'@'|'>'|'['|']'|'{'|'}'|'^'|'_'|'`'|'|'|'~';


