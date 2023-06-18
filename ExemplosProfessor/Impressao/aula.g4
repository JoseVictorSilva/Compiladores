grammar aula;

@header { import java.util.*; }
@members {
	Print x = new Print();
}

start: 	'inicio' {System.out.print(x.printInicio());} 
		comando
		'fim' {System.out.print(x.printFim());};

comando: 	ID {System.out.print($ID.text+" ");}
			Op_atrib {System.out.print($Op_atrib.text+" ");} 
			(NUM {System.out.print($NUM.text);} | ID {System.out.print($ID.text);})
			PV {System.out.print($PV.text+" ");};

ID: [a-z]([a-z]|[A-Z]|[0-9])*;
NUM: [0-9]+;
Op_atrib: '=';
PV: ';' ;
WS: [ \t\r\n]+ -> skip;