public class whileloop {
    public void whileFunction(int valor1, String operator, int valor2) {
        boolean condition;

        switch (operator) {
            case "<":
                condition = valor1 < valor2;
                break;
            case ">":
                condition = valor1 > valor2;
                break;
            default:
                throw new IllegalArgumentException("Invalid comparison operator: " + operator);
        }

        while (condition) {
            if (valor1 < valor2) {
                valor1++;
            }
            if (valor1 > valor2) {
                valor2++;
            }

            // Atualiza a condição para verificar se o loop deve continuar
            switch (operator) {
                case "<":
                    condition = valor1 < valor2;
                    break;
                case ">":
                    condition = valor1 > valor2;
                    break;
                case "==":
                    condition = valor1 == valor2; 
                    break;
                default:
                    throw new IllegalArgumentException("Invalid comparison operator: " + operator);
            }
        }
    }
}