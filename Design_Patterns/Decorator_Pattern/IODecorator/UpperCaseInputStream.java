import java.io.FilterInputStream;
import java.io.IOException;
import java.io.FilterInputStream;
import java.io.InputStream;

public class UpperCaseInputStream extends FilterInputStream {
    public UpperCaseInputStream(InputStream in) {
        super(in);
        System.out.println("UpperCaseInputStream initialized.");
    }

    public int read() throws IOException {
        int c = super.read();
        return (c == -1 ? c : Character.toUpperCase((char) c));
    }

    public int read(byte[] b, int offset, int len) throws IOException {
        int result = super.read(b, offset, len);

        for (int i = offset; i < offset + result; i++) {
            b[i] = (byte)Character.toUpperCase((char) b[i]);
        }

        return result;
    }
}