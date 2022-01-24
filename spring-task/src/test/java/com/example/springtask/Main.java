package com.example.springtask;

import static org.fusesource.jansi.Ansi.Color.GREEN;
import static org.fusesource.jansi.Ansi.Color.RED;
import static org.fusesource.jansi.Ansi.ansi;

/**
 * @author yanni
 * @date time 2022/1/25 3:40
 * @modified By:
 */
public class Main {
    public static void main(String[] args) {
        System.out.println( ansi() .fg(RED).a("Hello")  );
        System.out.println( ansi().eraseScreen().render("@|red Hello|@ @|green World|@") );
    }
}
