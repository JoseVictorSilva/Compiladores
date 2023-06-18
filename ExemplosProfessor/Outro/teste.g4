grammar teste;
r: 'hello' ID ';' {System.out.println("OK "); };
ID: [a-zA-Z]+;
WS: [ \t\r\n]+ -> skip;