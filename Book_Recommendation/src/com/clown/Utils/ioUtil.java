package com.clown.Utils;

import com.clown.ui.main.MainController;

import java.util.logging.Level;
import java.util.logging.Logger;

public class ioUtil {
    public static void println(String s){
        System.out.println(s);
    }
    public static boolean isLetterDigitOrChinese(String str) {
        String regex = "^[a-z0-9A-Z\u4e00-\u9fa5]+$";
        return str.matches(regex);
    }
    public static void log(Level level,String msg,Object param){
        Logger.getLogger(MainController.class.getName()).log(level,msg,param);
    }
    public static void log(Level level,String msg){
        log(level,msg,null);
    }
    public static Logger getLogger(){
        return getLogger(MainController.class.getName());
    }
    public static Logger getLogger(String name){
        return Logger.getLogger(name);
    }
}