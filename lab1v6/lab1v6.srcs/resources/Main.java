import java.io.IOException;
import java.io.PrintWriter;

public class Main {
    private static final int FIELD_LENGTH = 9;
    public static void main(String[] args) {
        PrintWriter file = null;
        StringBuilder stringToFile = new StringBuilder("000000000");
        try{
            file = new PrintWriter("E:\\Erick\\Uni\\7_sem\\apvmis\\lab1v6\\" +
                    "lab1v6.srcs\\resources\\tb_in.txt", "UTF-8");

            for (int i = 0; i < 512; i++) {
                /*file.println(stringToFile.replace(
                        FIELD_LENGTH - Integer.toBinaryString(i).length(),
                        FIELD_LENGTH, Integer.toBinaryString(i)).toString());*/
                file.println(i);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (file != null) {
                file.close();
            }
        }
    }
}
