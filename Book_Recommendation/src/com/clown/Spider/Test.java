package com.clown.Spider;

import com.clown.Modules.Book;
import javafx.scene.Parent;
import org.apache.commons.lang3.StringEscapeUtils;
import org.jsoup.helper.StringUtil;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test {
    public static void main(String[] args) throws Exception {

        Map<String ,Integer> typeLike = new HashMap<String ,Integer>();
        System.out.println(typeLike.get("sdf"));
        typeLike.put("a",1);

        System.out.println(typeLike.get("a"));
        typeLike.put("a",3);
        System.out.println(typeLike.get("a"));
    }


}
