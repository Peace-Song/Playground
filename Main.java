import java.util.*;

class Main{
    public static void main(String[] args){
        System.out.println("List of prime numbers:");
        int i = 2;
        int linePrintCount = 0;
        while(true){
            int count = 0;
            
            for(int j = 1; j <= i; j++)
                if(i % j == 0) count++;

            if(count == 2){
                if(linePrintCount == 8){
                    System.out.println("");
                    linePrintCount = 0;
                }
                System.out.print(" | "+ i + "\t");
                linePrintCount++;
            }
            i++;
        }
        //System.out.println("Fuck you");
    }
}
