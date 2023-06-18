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

/* 
inicio: {saida+= x.printInicio();}
                'inicio' 
                    cmd
                'fim' 
            {saida+= x.printFim();} 
        {System.out.println(saida);} ;
*/

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
'BatInt' ({tipo= 0; saida+= "int ";} | 'BatChar' {tipo= 1; saida+="char ";} | 'Batdouble' {tipo= 2; saida+="double ";})

;


cmdDeclVar:
    (tipo ID {Variavel y= new Variavel($ID.text, tipo);
                boolean ret= cv.adiciona(y);
                if(!ret){
                    System.out.println("Variavel " +$ID.text+ " ja existe");
                    System.exit(0);
                    }} FL {saida+=$ID.text+";\n\t";} ) FL
;

// Revisar-> Diferenciação entre Strings e Variaveis durante o print
cmdPrint:
    'Batprint' AC (ID {boolean ret = cv.Existe($ID.text);
                        if(ret){
                            saida+=x.printString($ID.text);
                        }
                      })* FC FL
    | 'Batprint' AC (TEXTO {saida+=x.printString($TEXTO.text);})* FC FL
;





ID: [a-z]([a-z]|[A-Z]|[0-9])*;
AC: '(';
FC: ')';
NUM:[0-9]+;
DOU: [0-9]+ '.' [0-9];
Op_atrib: '=';
WS: [ \t\r\n]+ -> skip;

ADD:'+';
SUB:'-';
MUL:'*';
DIV:'/';

AS:'"';

FL: 'BAT';
TEXTO: ' " ' [a-z]([a-z]|[A-Z]|[0-9])* ' " ';

OP_REL: '<'|'>'|'<='|'>='|'!='|'==';

INC:'++';
DEC:'--';
