import java.util.Stack;
import java.util.List;

public class If {
    private ControlVariavel cv;
    private Print printer;
    private Stack<Boolean> conditionStack;

    public If(ControlVariavel cv, Print printer) {
        this.cv = cv;
        this.printer = printer;
        this.conditionStack = new Stack<>();
    }

    public void processIf(String varName, String operator, int value) {
        Variavel variable = cv.busca(varName);

        if (variable != null && variable.getTipo() == 0) {
            int variableValue = Integer.parseInt(variable.getValor());
            boolean condition = false;

            switch (operator) {
                case ">":
                    condition = variableValue > value;
                    break;
                case "<":
                    condition = variableValue < value;
                    break;
                case ">=":
                    condition = variableValue >= value;
                    break;
                case "<=":
                    condition = variableValue <= value;
                    break;
                case "==":
                    condition = variableValue == value;
                    break;
                case "!=":
                    condition = variableValue != value;
                    break;
                default:
                    System.out.println("Operador inválido: " + operator);
                    return;
            }

            conditionStack.push(condition);
        } else {
            System.out.println("Variável não encontrada ou não é do tipo inteiro: " + varName);
        }
    }

    public void processElse() {
        if (!conditionStack.isEmpty()) {
            boolean condition = conditionStack.pop();

            if (!condition) {
                System.out.println("Executando o bloco de código do 'SENÃO'");
            }
        } else {
            System.out.println("Declaração 'SENÃO' encontrada sem uma declaração 'SE' correspondente.");
        }
    }
}
