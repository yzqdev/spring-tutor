package com.example.springtask;

import org.fusesource.jansi.AnsiConsole;
import org.junit.jupiter.api.Test;

import static org.fusesource.jansi.Ansi.Color.GREEN;
import static org.fusesource.jansi.Ansi.Color.RED;
import static org.fusesource.jansi.Ansi.ansi;


class TaskTests {

    @Test
    void contextLoads() {

        AnsiConsole.systemInstall();
        System.out.println( ansi().eraseScreen().fg(RED).a("Hello").fg(GREEN).a(" World")  );
        System.out.println( ansi().eraseScreen().render("@|red Hello|@ @|green World|@") );
    }

}
