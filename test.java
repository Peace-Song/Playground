import java.lang.*;
import java.util.ArrayList;

public class test{
  public static void main(String[] args){
    /*ArrayList<String> arr1 = null;
    ArrayList<String> arr2 = new ArrayList<String>();
    arr2.add("hello");
  
    ArrayList<ArrayList<String>> arrarr = new ArrayList<ArrayList<String>>();
    arrarr.add(arr1);
    arrarr.add(arr2);

    System.out.println("arr1: " + arrarr.get(0));
    System.out.println("arr2: " + arrarr.get(1).get(0));
    return;*/

    String str = "::";
    System.out.println("0: " + str.split(":", 3)[0]);
    System.out.println("1: " + str.split(":", 3)[1]);
    System.out.println("2: " + str.split(":", 3)[2]);




  }
}
