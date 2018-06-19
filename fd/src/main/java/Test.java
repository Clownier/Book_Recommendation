
public class Test {
    public static void main(String[] args) throws Exception{
//        JsoupHelper.fecthByMap("http://www.jianshu.com/u/bf7b9c013c55","//ul[@class='note-list']/li//a[@class='title']");
        JsoupHelper.fecthByMap("https://m.qidian.com/book/1003713593","//*[@id=\"bookSummary\"]/content");
    }
}
