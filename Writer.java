import java.io.FileWriter;
import java.io.IOException;

public class Writer {
    public void write(String saida){
        try{
            FileWriter f = new FileWriter("C:\\Users\\vitao\\Documentos\\Documentos\\José\\Aulas\\Anhembi\\Compiladores\\CompiladoresGit\\Compiladores\\Saida.java", false);
            f.write(saida);
            f.close();
            exec(saida);
        }
        catch (IOException e){
            e.printStackTrace();
            System.out.println("Algum erro aconteceu e gerou um erro durante a saída do código java");

        }
    }
    public void exec(String saida){
        String caminhoArquivo = "C:\\Users\\vitao\\Documentos\\Documentos\\José\\Aulas\\Anhembi\\Compiladores\\CompiladoresGit\\Compiladores\\Saida.java";

        try {
            ProcessBuilder pb = new ProcessBuilder("java", caminhoArquivo);
            pb.inheritIO(); // Redireciona a entrada/saída padrão do processo atual para o processo filho
            Process processo = pb.start();
            int status = processo.waitFor(); // Aguarda o término do processo

            if (status == 0) {
                System.out.println("O arquivo foi executado com sucesso.");
            } else {
                System.out.println("Ocorreu um erro ao executar o arquivo.");
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
    public void limpa(){
        FileWriter g;
        try {
            g = new FileWriter("C:\\Users\\vitao\\Documentos\\Documentos\\José\\Aulas\\Anhembi\\Compiladores\\CompiladoresGit\\Compiladores\\Saida.java", false);
            g.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
