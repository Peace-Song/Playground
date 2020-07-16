import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.BufferedInputStream;
import java.io.InputStream;
import java.io.IOException;

public class InputTest {
    public static void main(String[] args) {
        int c;

        try {
            InputStream in = new UpperCaseInputStream(new BufferedInputStream(System.in));

            while((c = in.read()) >= 0) {
                System.out.print((char) c);
            }

            in.close();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }
}