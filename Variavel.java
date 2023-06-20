public class Variavel {
    private String nome;
    private int tipo;
    private String valor;

    public Variavel(String nome, int tipo, String valor) {
        this.nome = nome;
        this.tipo = tipo;
        
        if (tipo == 0){
            if (valor.startsWith("\"") || valor.endsWith("\"")) {
                throw new IllegalArgumentException("O valor da variável Inteira não deve ter aspas ou letras.");
                
            }
            if (valor.contains(".")) {
                throw new IllegalArgumentException("O valor da variável Inteira não pode ter pontos.");
            }
        }
        if (tipo == 2){
            if (valor.startsWith("\"") || valor.endsWith("\"")) {
                throw new IllegalArgumentException("O valor da variável Double não deve estar entre aspas.");  
            }
            if (!valor.matches("^\\d*\\.?\\d+$")) {
                throw new IllegalArgumentException("O valor da variável double deve conter apenas dígitos numéricos e um ponto.");
            }
        }
        
        this.valor = valor;
    }

    public String getNome(){
        return nome;
    }

    public void setNome(String nome){
        this.nome= nome;
    }
    
    public int getTipo(){
        return tipo;
    }

    public void setTipo(int tipo){
        this.tipo= tipo;
    }

    public String getValor(){
        return valor;
    }

    public void setValor(String valor){
        this.valor= valor;
    }

    public void imprime(){
        System.out.println("Nome " +nome+ "\nTipo: " +tipo+ "\nValor: " +valor);
    }
    
}
