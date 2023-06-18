grammar tok;

@header { import java.util.*; }


start: 'inicio' ID {System.out.println("ID: "+$ID.text);} ';' 'fim' {System.out.println("programa finalizado"); };

ID: [a-z]+;
WS: [ \t\r\n]+ -> skip;