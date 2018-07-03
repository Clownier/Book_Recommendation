package com.clown.Spider;

import com.clown.Modules.Book;
import javafx.util.Pair;
import org.htmlcleaner.CleanerProperties;
import org.htmlcleaner.DomSerializer;
import org.htmlcleaner.HtmlCleaner;
import org.htmlcleaner.TagNode;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;
import java.io.IOException;
import java.util.*;

public class JsoupHelper {

    public static Object fecthNode(String url, String xpath) throws Exception {
        String html = null;
        try {
            Connection connect = Jsoup.connect(url);
            html = connect.get().body().html();
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

        HtmlCleaner hc = new HtmlCleaner();
        TagNode tn = hc.clean(html);
        Document dom = new DomSerializer(new CleanerProperties()).createDOM(tn);
        XPath xPath = XPathFactory.newInstance().newXPath();

        Object result = xPath.evaluate(xpath, dom, XPathConstants.NODESET);

        return result;
    }
    public static String getText(String url,String xpath) throws Exception {
        Object res = fecthNode(url,xpath);
        if(res instanceof  NodeList){
            NodeList nodeList = (NodeList) res;
            if(nodeList.getLength() == 1){
                return nodeList.item(0).getTextContent();
            }
            else {
                throw new Exception("there are more than one Content");
            }
        }
        return null;
    }
/**
 *获取xpath下的a标签的文本值及href属性值
 /**/
     public static Map<String, String> fecthByMap(String url, String xpath) throws Exception {
     Map<String, String> nodeMap = new LinkedHashMap<String, String>();

     Object result = fecthNode(url, xpath);

     if (result instanceof NodeList) {
         NodeList nodeList = (NodeList) result;

         for (int i = 0; i < nodeList.getLength(); i++) {
             Node node = nodeList.item(i);
             if(node == null){
                continue;
             }
             nodeMap.put(node.getTextContent(), node.getAttributes().getNamedItem("href")!=null ?
                                    node.getAttributes().getNamedItem("href").getTextContent() : "");
             String item = node.getTextContent() + " : " + node.getAttributes().getNamedItem("href");
             System.out.println(node.getTextContent() + " : " + node.getAttributes().getNamedItem("href"));
         }
     }

     return nodeMap;
     }
 /**
 *获取xpath下的某个属性值
 /**/
     public static List<String> fecthAttr(String url, String xpath, String attr) throws Exception {
     List<String> list = new ArrayList<String>();

     Object result = fecthNode(url, xpath);

     if (result instanceof NodeList) {
     NodeList nodeList = (NodeList) result;

     for (int i = 0; i < nodeList.getLength(); i++) {
     Node node = nodeList.item(i);
     if(node == null){
     continue;
     }
     list.add(node.getAttributes().getNamedItem(attr).getTextContent());

     //System.out.println(node.getTextContent() + " : " + node.getAttributes().getNamedItem("href"));
     }
     }

     return list;
     }
     public static String escapeHtml(String s){
//         String res = s.replace("&lt;","<")
//                 .replace("&gt;",">")
//                 .replace(("&amp;","&")
//                 .replace("&quot;","\"")
//                 .replace();
         String res = s.replace("&amp;hellip;","...")
                 .replace("&hellip;","...")
                 .replace("&amp;ldquo;","“")
                 .replace("&ldquo;","“")
                 .replace("&amp;rdquo;","”")
                 .replace("&rdquo;","”")
                 .replace("&amp;mdash;","-")
                 .replace("&mdash;","-");
         return res;
     }

     public static Book getNewBook(String bid) throws Exception {
         String url = "https://m.qidian.com/book/"+bid;
         String sum = JsoupHelper.getText(url,"//*[@id=\"bookSummary\"]/content");
         sum = sum.replace("\n","").trim();
         sum = JsoupHelper.escapeHtml(sum);
         String state = JsoupHelper.getText(url,"//*[@id=\"bookDetailWrapper\"]/div/div[1]/div/p[2]");
         state = state.substring(state.indexOf("|")+1);
         String type = JsoupHelper.getText(url,"//*[@id=\"bookDetailWrapper\"]/div/div[1]/div/p[1]");
         type = type.replace("/","-");
         String BNAME = JsoupHelper.getText(url,"//*[@id=\"bookDetailWrapper\"]/div/div[1]/div/h2");

         String name = JsoupHelper.getText(url,"//*[@id=\"bookDetailWrapper\"]/div/div[1]/div/div[1]/a");
         name = name.replace("\n","").replace(" ","");
         name = name.substring(3,name.indexOf("级别"));

         Book book = new Book(bid,BNAME,name,type,state,sum,"http://qidian.qpic.cn/qdbimg/349573/"+bid+"/150");
         return book;
     }
     public static LinkedList<Pair<String,String>>  getNewReward(String bid){
         String url = "https://m.qidian.com/book/"+bid+"/fans";
         String html = null;
         try {
             Connection connect = Jsoup.connect(url);
             html = connect.get().body().html();
         } catch (IOException e) {
             e.printStackTrace();
         }
         LinkedList<Pair<String,String>> reward= new LinkedList<Pair<String,String>>();
         for(int i =0;i<100;i++){
             String Beg ="<div class=\"book-title-x\"> \n" +
                     "        <div class=\"book-title-r\"> \n" +
                     "         <span class=\"gray\">";
             assert html != null;
             int t =html.indexOf(Beg);
             if(t == -1) break;
             html = html.substring(t+Beg.length());
             String num = html.substring(0,html.indexOf("</span>"));
             Beg = "位\">";
             html = html.substring(html.indexOf(Beg)+Beg.length());
             String name = html.substring(0,html.indexOf("</h4> "));
             reward.add(new Pair<>(name,num));
         }
         return reward;
     }
}
