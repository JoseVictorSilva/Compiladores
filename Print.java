
public class Print{
    public Print(){}

    public String printInicio(){
		return "public class Saida{ \n\tpublic static void main(String[] args){\n\t";

	}

	public String printString(String frase){
		
		return "System.out.println("+ frase +");\n\t";
		
}
	
	public String printFim(){
		return "\n\t}\n}";

	}
}
