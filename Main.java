import java.util.*;
import java.math.BigInteger;

class Main{
    public static void main(String[] args){
        Scanner scan = new Scanner(System.in);

        System.out.println("Input initial integer n.");
        while(true){
            String n_str = scan.nextLine();
            System.out.println("Collatz Conjecture of n == " + n_str);

            BigInteger n = new BigInteger(n_str);
            
            int count = 0;
            System.out.println("n == " + n + "\t\t| count == " + count);
            while(n.compareTo(BigInteger.valueOf(1)) != 0){
                if(n.compareTo(BigInteger.valueOf(0)) < 0){
                    System.out.println("Invalid n.");
                    break;
                }
                if(n.subtract((n.divide(BigInteger.valueOf(2))).multiply(BigInteger.valueOf(2))).compareTo(BigInteger.valueOf(0)) == 0) n = n.divide(BigInteger.valueOf(2));
                else{
                    n = n.multiply(BigInteger.valueOf(3));
                    n = n.add(BigInteger.valueOf(1)); 
                }
                count++;
                System.out.println("n == " + n + "\t\t| count == " + count);
            }
            System.out.println("Input next integer n.");
        }
    }
}
