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


ID  : ('a'..'z' | 'A'..'Z')+;

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;
CHAR2 :'\''('A'..'Z'|'a'..'z'|'0'..'9'|ESC|'\''|)'\'';
CHAR : '\''(ESC|~'\'')'\'';
STRING : '"' (ESC|~'"')* '"';
BARRAS :  '\n' '\t' '\\' '\"';

fragment
ESC :  '\\' ('n'|'"')|'\\' ('t'|'"')|'\\''\\'|'\\' ('p'|'"');
