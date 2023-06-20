grammar Bat;

options{
    language=Java;
}

@header {    
    import java.util.*;
    import java.io.FileWriter;
    import java.io.IOException;
}

@members{

    Print x= new Print();
    ControlVariavel cv= new ControlVariavel();
    Writer w = new Writer();
    String saida="";
    int tipo;
    String nome;
}

start:
	{saida+= "import java.util.Scanner;";}
	{saida+= "import java.util.Locale;";} {saida+="\n\t";}
       'Start' {saida+= x.printInicio();}
       cmd
       'fim'{saida+= x.printFim();}
       {w.write(saida);}
       {System.out.println(saida);}
    ;
       
cmd:
   ( cmdDeclVar
    |cmdIF
    |cmdPrint
    |cmdContas
    |cmdScanInt
	|cmdScanDouble
	|cmdScanString
    |cmdWhile
    |cmdDoWhile
	
   )*
;


tipo: 
('BatInt' {tipo= 0; saida+= "int ";} 
| 'BatChar' {tipo= 1; saida+="String ";} 
| 'BatDouble' {tipo= 2; saida+="double ";})
;

cmdDeclVar:
    tipo 
    ID 
    Op_atrib 
    TESTE
    FL
    ({Variavel y= new Variavel($ID.text, tipo, $TESTE.text) ;
                boolean ret = cv.adiciona(y);
                if(!ret){
                    System.out.println("Variavel " +$ID.text+" ja existe");
                    System.exit(0);
                    }}) 
    {saida+=" "+$ID.text;} 
    {saida+=" = ";} 
    {saida+=$TESTE.text+";\n\t";}
;

cmdContas:
    ID
    Op_atrib
    expr 
    FL
    { saida += $ID.text +" = "+" " + $expr.text + ";\n\t"; }
;

expr:
    expr ('*' | '/') expr    
    | expr ('+' | '-') expr  
    | TESTE                       
    | ID               
;

// Revisar-> Diferenciação entre Strings e Variaveis durante o print
cmdPrint:
    'Batprint' AP ((ID {boolean ret = cv.Existe($ID.text);
                        if(ret){
                            saida+=x.printString($ID.text);
                        }
                        })
                    | (TESTE) {saida+=x.printString($TESTE.text);}
                    | STRING {saida+="System.out.println("+$STRING.text+");"; }  
                    ) 
                FP
            FL
;


cmdIF: 'se' {saida+="if"; } AP {saida+="("; } comp FP {saida+=$comp.text+")"; } AC {saida+="{\n\t"; } cmd FC {saida+="}";} 
		('senao' {saida+="else"; }AC {saida+="{\n\t"; }cmd FC {saida+="}\n\t"; })? 
;


cmdScanDouble: 'scanDouble' AP (ID) FP FL {saida+=$ID.text+" = scanner.nextDouble();";} {saida+="\n\t"; }     

;

cmdScanInt: 'scanInt' AP (ID) FP FL {saida+=$ID.text+" = scanner.nextInt();";} {saida+="\n\t"; }     

;
cmdScanString: 'scanString' AP (ID) FP FL {saida+=$ID.text+" = scanner.nextLine();";} {saida+="\n\t"; }     

;

cmdDoWhile: 
  'Batdo' { saida+= "do"; } AC {saida+="{";}  cmd ( ID {saida+= $ID.text;}(LACO)?{saida+= $LACO.text;})FL {saida+= ";";} FC {saida+="}";} 

  'Batwhile'{saida+= "while";} AP { saida += "("; } comp { saida += $comp.text; } FP { saida += ")"; } FL { saida += ";"; }
;

cmdWhile: 'enquanto' {saida+="while"; } AP {saida+="("; } comp FP {saida+=$comp.text+")"; } AC {saida+="{\n\t"; } cmd 
    ID (LACO)? {saida +=$ID.text;} {saida += $LACO.text+";\n\t";} FL

FC {saida+="}\n\t"; }
;

AS:'"';
AP: '(';
FP: ')';
AC: '{';
FC: '}';

TESTE: ((DOU)| (NUM) | (STRING));
comp:  (TESTE | ID) OP_REL (TESTE | ID);
NUM:[0-9]+;
STRING: '"' (~["\r\n])* '"';
ID: [a-zA-Z]([a-zA-Z])*;
DOU: [0-9]+ '.' [0-9]+;

Op_atrib: '=';
ADD:'+';
SUB:'-';
MUL:'*';
DIV:'/';

ATR:(ID Op_atrib NUM) ;
FL: ';';

LACO: (INC | DEC );

OP_REL: '<'|'>'|'<='|'>='|'!='|'==';

INC:'++';
DEC:'--';

WS: [ \t\r\n]+ -> skip;