package spring.security.jwt;

import org.junit.jupiter.api.Test;

import java.util.Enumeration;
import java.util.Random;
import java.util.Vector;

/**
 * @author yanni
 * @date time 2022/6/8 22:52
 * @modified By:
 */
public class RandomTest {

    @Test
    void printb(){
        Random r = new Random();
        for (int i = 0; i < 1000; i++) {
            for (int j = 0; j < 1000; j++) {
                if(r.nextInt(4) == 0) {
                    System.out.print("O");
                } else {
                    System.out.print("#");
                }
            }

            System.out.println("");
        }
//3s 458ms
    }
    @Test
    void printSharp(){
        Random r = new Random();
        for (int i = 0; i < 1000; i++) {
            for (int j = 0; j < 1000; j++) {
                if(r.nextInt(4) == 0) {
                    System.out.print("O");
                } else {
                    System.out.print("B");
                }
            }

            System.out.println("");
        }
//2s 354ms
    }

    @Test
    void randomNot(){
        System.out.println(randomString(-229985452) + " " + randomString(-147909649));
        System.out.println(randomString(3));
    }


    public static String randomString(int i)
    {
        Random ran = new Random(i);
        StringBuilder sb = new StringBuilder();
        while (true)
        {
            int k = ran.nextInt(27);
            if (k == 0)
                break;
            System.out.println(k);
            sb.append((char)('`' + k));
        }
        return sb.toString();
    }
}
