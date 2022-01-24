package com.yzq.transfer;

import org.junit.jupiter.api.Test;

public class ColorUtil {
    /**
     * @param color   颜色代号：背景颜色代号(41-46)；前景色代号(31-36)
     * @param type    样式代号：0无；1加粗；3斜体；4下划线
     * @param content 要打印的内容
     */
    private static String colorLog(String content, int color, int type) {
        boolean hasType = type != 1 && type != 3 && type != 4;
        if (hasType) {
            return String.format("\033[%dm%s\033[0m", color, content);
        } else {
            return String.format("\033[%d;%dm%s\033[0m", color, type, content);
        }
    }

    private static void red(String content) {
        colorLog(content, 31, 0);
    }

    private static void green(String content) {
        colorLog(content, 32, 0);
    }
    private static void yellow(String content) {
        colorLog(content, 33, 0);
    }
    private static void blue(String content) {
        colorLog(content, 34, 0);
    }
    private static void purple(String content) {
        colorLog(content, 35, 0);
    }
    private static void cyan(String content) {
        colorLog(content, 36, 0);
    }

    private static void redBold(String content) {
        colorLog(content, 31, 1);
    }

    private static void greenBold(String content) {
        colorLog(content, 32, 1);
    }
    private static void yellowBold(String content) {
        colorLog(content, 33, 1);
    }
    private static void blueBold(String content) {
        colorLog(content, 34, 1);
    }
    private static void purpleBold(String content) {
        colorLog(content, 35, 1);
    }
    private static void cyanBold(String content) {
        colorLog(content, 36, 1);
    }

    private static void redItalic(String content) {
        colorLog(content, 31, 3);
    }

    private static void greenItalic(String content) {
        colorLog(content, 32, 3);
    }
    private static void yellowItalic(String content) {
        colorLog(content, 33, 3);
    }
    private static void blueItalic(String content) {
        colorLog(content, 34, 3);
    }
    private static void purpleItalic(String content) {
        colorLog(content, 35, 3);
    }
    private static void cyanItalic(String content) {
        colorLog(content, 36, 3);
    }

    private static void redUnderline(String content) {
        colorLog(content, 31, 4);
    }

    private static void greenUnderline(String content) {
        colorLog(content, 32, 4);
    }
    private static void yellowUnderline(String content) {
        colorLog(content, 33, 4);
    }
    private static void blueUnderline(String content) {
        colorLog(content, 34, 4);
    }
    private static void purpleUnderline(String content) {
        colorLog(content, 35, 4);
    }
    private static void cyanUnderline(String content) {
        colorLog(content, 36, 4);
    }



    public void showColor() {
        System.out.println("控制台颜色测试：");
        System.out.println(colorLog("[ 红色 ]", 31, 0));
        System.out.println(colorLog("[ 黄色 ]", 32, 0));
        System.out.println(colorLog("[ 橙色 ]", 33, 0));
        System.out.println(colorLog("[ 蓝色 ]", 34, 0));
        System.out.println(colorLog("[ 紫色 ]", 35, 0));
        System.out.println(colorLog("[ 绿色 ]", 36, 0));
        System.out.println(colorLog("[ 绿色 ]", 41, 0));
    }
}
