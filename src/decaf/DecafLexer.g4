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

KEYWORD: 'boolean'|'callout'|'class'|'else'|'false'|'if'|'int'|'return'|'true'|'void'|'for'|'forpar'|'break'|'continue';


OP: '+'|'-'|'*'|'<'|'<='|'!='|'&&';

NUMBER: SINAIS?'0'..'9'+;
STRING :'"' ('a'..'z'|'A'..'Z'|'0'..'9'|ASC|ESC|' ' )* '"';



WS_ :(' ' | '\n' ) -> skip;

SL_COMMENT :'//' (~'\n')* '\n' -> skip;
CHAR2 :'\''('A'..'Z'|'a'..'z'|'0'..'9'|ESC|ASC)'\'';
HEX: '0''x'('A'..'Z'|'a'..'z'|'0'..'9')+;


BARRAS :'\n' '\t' '\\' '\"';



SINAIS: '-';

TK: ','|'?'|'!'|'#'|'$'|'%'|'&'|'('|')'|'*'|'+'|'-'|'/'|':'|';'|'<'|'='|'@'|'>'|'['|']'|'{'|'}'|'^'|'_'|'`'|'|'|'~';

ID  :('a'..'z'|'A'..'Z'|'_'|'0'..'9')+;
fragment ESC :'\\' ('n'|'"'|'t'|'\''|'\\');

fragment ASC :','|'?'|'!'|'#'|'$'|'%'|'&'|'('|')'|'*'|'+'|'-'|'.'|'/'|':'|';'|'<'|'='|'@'|'>'|'['|']'|'{'|'}'|'^'|'_'|'`'|'|'|'~';


