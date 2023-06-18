import java.util.ArrayList;

public class ControlVariavel {
    //Lista que vai guardar cada uma das nossas variáveis
    private ArrayList<Variavel> acumulador;

    public ControlVariavel(){
        acumulador = new ArrayList<Variavel>();
    }
    

    public boolean adiciona(Variavel x){
        for(int i= 0; i<acumulador.size(); i++){
            if(acumulador.get(i).getNome().equals(x.getNome()))
                return false;
        }
        acumulador.add(x);
        return true;
    }

    public Variavel busca(String nome){
        for(int i=acumulador.size()-1; i>=0; i--){
            if(acumulador.get(i).getNome().equals(nome))
                return acumulador.get(i);
        } 
        return null;
    }

    public boolean Existe(String nome){
        for(int i= acumulador.size()-1; i>=0; i--){
            if(acumulador.get(i).getNome().equals(nome))
                return true;
        }
        return false;
    }


}
