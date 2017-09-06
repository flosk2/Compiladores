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

KEYWORD: 'if';

NUMBER: SINAIS?'0'..'9'+;

ID  :('a'..'z'|'A'..'Z'|'_'|'0'..'9'|'.')+;


WS_ :(' ' | '\n' ) -> skip;

SL_COMMENT :'//' (~'\n')* '\n' -> skip;
CHAR2 :'\''('A'..'Z'|'a'..'z'|'0'..'9'|ESC)'\'';
HEX: '0''x'('A'..'Z'|'a'..'z'|'0'..'9')+;

STRING :'"' (ESC|~'"')* '"';
BARRAS :'\n' '\t' '\\' '\"';



SINAIS: '-';

fragment
ESC :'\\' ('n'|'"')|'\\' ('t'|'"')|'\\''\\' ;

