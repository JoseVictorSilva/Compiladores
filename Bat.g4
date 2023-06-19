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
    //|cmdIf
    //|cmdWhile
    //|cmdFor
    |cmdPrint
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
        cmd
    '}'
    ( 'SENÃO' '{'
        cmd
    '}' {
        ifExample.processElse();
    })?
;



cmdPrint:
    'Batprint' AC ((ID {boolean ret = cv.Existe($ID.text);
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



AS:'"';
AC: '(';
FC: ')';
VAR: ((DOU) | (STRING));
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