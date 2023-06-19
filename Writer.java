import java.io.FileWriter;
import java.io.IOException;

public class Writer {
    public void write(String saida){
        try{
            FileWriter f = new FileWriter("C:\\Users\\vitao\\Documentos\\Documentos\\José\\Aulas\\Anhembi\\Compiladores\\CompiladoresGit\\Compiladores\\Saida.java", false);
            f.write(saida);
            f.close();
            try{
                Saida.main(new String[0]);
            } catch (Exception e){
                e.printStackTrace();
                System.out.println("Ainda não foi criado a classe Saida");
            }
    }
        catch (IOException e){
            e.printStackTrace();
            System.out.println("Algum erro aconteceu e gerou um erro durante a saída do código java");

        }
    }
}
