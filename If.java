public class If {
    private ControlVariavel cv;

    public If(ControlVariavel cv) {
        this.cv = cv;
    }

    public void processamentoIf(int valor1, String operator, int valor2) {
        boolean condition;

        switch (operator) {
            case "<":
                condition = valor1 < valor2;
                break;
            case ">":
                condition = valor1 > valor2;
                break;
            case "<=":
                condition = valor1 <= valor2;
                break;
            case ">=":
                condition = valor1 >= valor2;
                break;
            case "!=":
                condition = valor1 != valor2;
                break;
            case "==":
                condition = valor1 == valor2;
                break;
            default:
                throw new IllegalArgumentException("Invalid comparison operator: " + operator);
        }

        if (condition) {
            System.out.println("Condição eh verdadeira");
        } else {
            System.out.println("Condição eh falsa");
        }
    }

}
