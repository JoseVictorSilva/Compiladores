grammar Bat;

options{
    language=Java;
}

@header {    
    import java.util.*;

}

@members{
    //Obj Print, Classe Print e CV Classe ControlVariavel
    Print x= new Print();
    //Variavel y= new Variavel();
    ControlVariavel cv= new ControlVariavel();
    String saida="";
    int tipo;
    String nome;

    //

}

start:
       'Start' {saida+= x.printInicio();}
       cmd
       'fim'{saida+= x.printFim();}
       {System.out.println(saida);}
    ;
       
cmd:
   ( cmdDeclVar
    |cmdIF
    //|cmdWhile
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

expr:
    (VAR ASExpr VAR)*
    ;

ASExpr:
    MDExpr ((ADD | SUB) MDExpr)*
    ;

MDExpr:
     ((MUL | DIV ) )*

    ;

condicao:

        VAR OP_REL VAR

;

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
    {saida+=$ID.text;} 
    {saida+=" = ";} 
    {saida+=$VAR.text+";\n\t";}
;

cmdIf:
    'SE' AC condicao FC '{'
        
    '}'
    ( 'SENÃO' '{'
        
    '}' {
        ifExample.processElse();
    })?
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

// Revisar-> Diferenciação entre Strings e Variaveis durante o print
cmdPrint:
    'Batprint' AP ((ID {boolean ret = cv.Existe($ID.text);
                        if(ret){
                            saida+=x.printString($ID.text);
                        }
                        else{
                            saida+="System.out.println(";
                            saida+="\"";
                            saida+=$ID.text;
                            saida+="\");\n\t";
                        }
                        })
                    | NUM {saida+=x.printString($NUM.text);}
                    ) 
                FC 
           
;

cmdWhile: 
    'BatWhile' AC (NUM OP_REL NUM){
        saida+=x.whileFunction($NUM.text,$OP_REL,$NUM.text)
    } FC
    FL
;


AS:'"';
AC: '(';
FC: ')';
TESTE: ((DOU) | (STRING));
STRING: '"' ID '"';
ID: [a-zA-Z]([a-zA-Z])*;
NUM:[0-9]+;
DOU: [0-9]+ '.' [0-9]+;
Op_atrib: '=';
ADD:'+';
SUB:'-';
MUL:'*';
DIV:'/';

FL: ';';

OP_REL: '<'|'>'|'<='|'>='|'!='|'==';

INC:'++';
DEC:'--';

WS: [ \t\r\n]+ -> skip;