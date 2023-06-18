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

// Revisar-> Diferenciação entre Strings e Variaveis durante o print
cmdPrint:
    ('Batprint' AC (NUM {boolean ret = cv.Existe($NUM.text);
                        if(ret){
                            saida+=x.printString($NUM.text);
                        }
                      })* FC FL
    | 'Batprint' AC (STRING {saida+=x.printString($STRING.text);})* FC FL)
;



ID: [a-zA-Z0-9]([a-zA-Z0-9])*;
AC: '(';
FC: ')';
NUM: [0-9]+;
TESTE: ((DOU) | (NUM) | (STRING));
STRING:'"'[a-zA-Z0-9]([a-zA-Z0-9])* '"';
DOU: [0-9]+ '.' [0-9]+;
Op_atrib: '=';
WS: [ \t\r\n]+ -> skip;

ADD:'+';
SUB:'-';
MUL:'*';
DIV:'/';

AS:'"';

FL: ';';

OP_REL: '<'|'>'|'<='|'>='|'!='|'==';

INC:'++';
DEC:'--';
