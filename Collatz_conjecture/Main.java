import java.util.*;
import java.math.BigInteger;

class Main{
    public static void main(String[] args){
        //Scanner scan = new Scanner(System.in);

        //System.out.println("Input initial integer n.");
        BigInteger n = new BigInteger("1");
        BigInteger N;
        while(true){
            //String n_str = scan.nextLine();
            //System.out.println("Collatz Conjecture of n == " + n_str);

            //BigInteger n = new BigInteger(n_str);
            N = n;
            int count = 0;
            //System.out.println("n == " + n + "\t\t| count == " + count);
            while(N.compareTo(BigInteger.valueOf(1)) != 0){
                /*if(n.compareTo(BigInteger.valueOf(0)) < 0){
                    System.out.println("Invalid n.");
                    break;
                }*/
                if(N.subtract((N.divide(BigInteger.valueOf(2))).multiply(BigInteger.valueOf(2))).compareTo(BigInteger.valueOf(0)) == 0) N = N.divide(BigInteger.valueOf(2));
                else{
                    N = N.multiply(BigInteger.valueOf(3));
                    N = N.add(BigInteger.valueOf(1)); 
                }
                count++;
                //System.out.println("n == " + n + "\t\t| count == " + count);
            }
            System.out.println("Collatz Conjecture holds when n == " + n + " with count == " + count + ".");
            n = n.add(BigInteger.valueOf(1));
        }
    }
}
