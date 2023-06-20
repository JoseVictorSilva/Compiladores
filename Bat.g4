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
    //Obj Print, Classe Print e CV Classe ControlVariavel
    Print x= new Print();
    //Variavel y= new Variavel();
    ControlVariavel cv= new ControlVariavel();
    Writer w = new Writer();
    String saida="";
    int tipo;
    String nome;

    //

}

start:

       'Start' {saida+= x.printInicio();}
       cmd
       'fim'{saida+= x.printFim();}
       {w.write(saida);}
    ;
       
cmd:
   ( cmdDeclVar
    |cmdIF
    |cmdWhile
    //|cmdFor
    |cmdPrint
    |cmdContas
 
    //|cmdScan
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
    {saida+=$ID.text;} 
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
cmdIF: 'se' {saida+="if"; } AP {saida+="("; } comp FP {saida+=$comp.text+")"; } AC {saida+="{\n\t"; } cmd FC {saida+="}";} 
		('senao' {saida+="else"; }AC {saida+="{\n\t"; }cmd FC {saida+="}\n\t"; })? 
;

cmdWhile: 'enquanto' {saida+="while"; } AP {saida+="("; } comp FP {saida+=$comp.text+")"; } AC {saida+="{\n\t"; } cmd 
    ID (LACO)? {saida +=$ID.text;} {saida += $LACO.text+";\n\t";} FL

FC {saida+="}\n\t"; }
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

FL: ';';

LACO: (INC | DEC );

OP_REL: '<'|'>'|'<='|'>='|'!='|'==';

INC:'++';
DEC:'--';

WS: [ \t\r\n]+ -> skip;