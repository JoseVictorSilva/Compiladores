import java.util.Scanner;import java.util.Locale;
	public class Saida{ 
	public static void main(String[] args){
	 Scanner scanner = new Scanner(System.in);
	 scanner.useLocale(Locale.US);
	int  inteiro = 1;
	double  pontos = 5.1;
	String  string = "Testando";
	System.out.println("Valor Inteiro");
	System.out.println(inteiro);
	System.out.println("Valor com Ponto Flutuante");
	System.out.println(pontos);
	System.out.println("Valor da String");
	System.out.println(string);
	pontos =  inteiro+pontos+23-5*4/2;
	System.out.println("Conta realizada, resultado:");
	System.out.println(pontos);
	int  soma = 2;
	soma =  inteiro+soma;
	System.out.println("Conta realizada, resultado:");
	System.out.println(soma);
	System.out.println("Insira uma String: ");
	string = scanner.nextLine();
	System.out.println("Insira um Inteiro: ");
	soma = scanner.nextInt();
	System.out.println("Insira um Double: ");
	pontos = scanner.nextDouble();
	System.out.println("Valor da String");
	System.out.println(string);
	System.out.println("Valor Inteiro");
	System.out.println(soma);
	System.out.println("Valor com Ponto Flutuante");
	System.out.println(pontos);
	System.out.println("INICIO DO IF");
	int  condicao = 5;
	if(condicao>0){
	System.out.println("A condicao e maior que 0");
	}else{
	System.out.println("A condicao nao e maior que 0");
	}
	if(soma==3){
	System.out.println("A condicao e igual a 3");
	}else{
	System.out.println("A condicao nao e igual a 3");
	}
	System.out.println("INICIO DOS LACOS");
	while(pontos>0){
	System.out.println(pontos);
	pontos--;
	}
	while(soma<20){
	System.out.println(soma);
	soma++;
	}
	do{System.out.println(soma);
	soma--;}while(soma>10);
	}
}