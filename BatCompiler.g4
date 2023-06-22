grammar BatCompiler;

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

// Inicia o nosso compilador com o comando grun Bat start (arquivo.txt)
start:
	{saida+= "import java.util.Scanner;";}
	{saida+= "import java.util.Locale;";} {saida+="\n\t";}
       'BATMAN' {saida+= x.printInicio();}
       cmd
       'BATEND'{saida+= x.printFim();}
       {w.write(saida);}
       {System.out.println(saida);}
    ;

// Define a cadeia de comandos que podem ser chamados       
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
| 'BatString' {tipo= 1; saida+="String ";} 
| 'BatDouble' {tipo= 2; saida+="double ";})
;

// Declara a variável, a gramática é: tipo ID = VAR;
cmdDeclVar:
    tipo 
    ID 
    Op_atrib 
    VAR
    FL
    ({Variavel y= new Variavel($ID.text, tipo, $VAR.text) ;
                boolean ret = cv.adiciona(y);
                if(!ret){
                    System.out.println("Variavel " +$ID.text+" ja existe");
                    System.exit(0);
                    }}) 
    {saida+=" "+$ID.text;} 
    {saida+=" = ";} 
    {saida+=$VAR.text+";\n\t";}
;

// Comando que realiza as contas, gramática: ID = expr; (expr = NUM + NUM, DOU - DOU)
cmdContas:
    ID
    Op_atrib
    expr 
    FL
    { saida += $ID.text +" = "+" " + $expr.text + ";\n\t"; }
;

// expr define a precedência
expr:
    expr ('*' | '/') expr    
    | expr ('+' | '-') expr  
    | VAR                       
    | ID               
;

// Comando de Print, funcionando da seguinte forma -> BatPrint(ID ou VAR ou STRING);
cmdPrint:
    'BatPrint' AP ((ID {boolean ret = cv.Existe($ID.text);
                        if(ret){
                            saida+=x.printString($ID.text);
                        }
                        })
                    | (VAR) {saida+=x.printString($VAR.text);}
                    | STRING {saida+="System.out.println("+$STRING.text+");"; }  
                    ) 
                FP
            FL
;



// Comando de scan para números com ponto Flutuante, BatScanDouble(ID);
cmdScanDouble: 'BatScanDouble' AP (ID) FP FL {saida+=$ID.text+" = scanner.nextDouble();";} {saida+="\n\t"; }     
;

// Comando de scan para números inteiros, BatScanInt(ID);
cmdScanInt: 'BatScanInt' AP (ID) FP FL {saida+=$ID.text+" = scanner.nextInt();";} {saida+="\n\t"; }     
;

// Comando de scan para Strings, BatScanString(ID);
cmdScanString: 'BatScanString' AP (ID) FP FL {saida+=$ID.text+" = scanner.nextLine();";} {saida+="\n\t"; }     
;

// Comando de condicional, sua gramática é: BatIf(comp){cmd} BatElse{cmd};
cmdIF: 'BatIf' {saida+="if"; } AP {saida+="("; } comp FP {saida+=$comp.text+")"; } AC {saida+="{\n\t"; } cmd FC {saida+="}";} 
		('BatElse' {saida+="else"; }AC {saida+="{\n\t"; }cmd FC {saida+="}\n\t"; })? 
;

// Comando de repetição, ficando então BatWhile(comp){cmd};
cmdWhile: 'BatWhile' {saida+="while"; } AP {saida+="("; } comp FP {saida+=$comp.text+")"; } AC {saida+="{\n\t"; } cmd 
    ID (LACO)? {saida +=$ID.text;} {saida += $LACO.text+";\n\t";} FL

FC {saida+="}\n\t"; }
;

// Comando de repetição, ficando então BatDo{cmd}BatDoWhile(comp);
cmdDoWhile: 
  'BatDo' { saida+= "do"; } AC {saida+="{";}  cmd ( ID {saida+= $ID.text;}(LACO)?{saida+= $LACO.text;})FL {saida+= ";";} FC {saida+="}";} 

  'BatDoWhile'{saida+= "while";} AP { saida += "("; } comp { saida += $comp.text; } FP { saida += ")"; } FL { saida += ";"; }
;


// Regras Gerais da Gramática
AS:'"';
AP: '(';
FP: ')';
AC: '{';
FC: '}';

VAR: ((DOU)| (NUM) | (STRING));
comp:  (VAR | ID) OP_REL (VAR | ID);
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

COMENTARIO:'//' ~[\r\n]* -> skip;

WS: [ \t\r\n]+ -> skip;