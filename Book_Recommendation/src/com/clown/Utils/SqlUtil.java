package com.clown.Utils;


import com.clown.Config.Preferences;
import com.clown.Modules.Book;
import com.clown.Modules.RecommendBook;
import com.clown.Spider.JsoupHelper;
import com.sun.org.apache.regexp.internal.RE;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.util.Pair;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.swing.*;
import java.sql.*;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;


public class SqlUtil {
    private static Logger logger = LogManager.getLogger(SqlUtil.class);
    public static Connection connection = null;
    public static Statement statement = null;

    public static void initConnect(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            logger.info("成功加载MySQL驱动");
        } catch (ClassNotFoundException e) {
            logger.fatal("找不到MySQL驱动",e);
        }
        String url = "jdbc:mysql://localhost:3306/qidian?useUnicode=true&;characterEncoding=utf-8&;useSSL=false";
        try {
            connection = DriverManager.getConnection(url,"root","asdf0931");
            statement = connection.createStatement();
            logger.info("连接数据库成功");
        } catch (Exception e) {
            logger.fatal("无法连接数据库！",e);
        }
    }

    public PreparedStatement getPreparedStatement(String command) throws SQLException {
        return connection.prepareStatement(command);
    }


    public ResultSet quary(String command){
        ResultSet res = null;
        try{
            res = statement.executeQuery(command);
        } catch (SQLException e) {
            e.printStackTrace();
            ioUtil.println("query command error:"+command);
        }
        return res;
    }

    public PreparedStatement updateOrDelete(String command){
        PreparedStatement preparedStatement = null;
        try{
            preparedStatement = connection.prepareStatement(command);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return preparedStatement;
    }
    public void setConnection(boolean AutoCommit){
        try {
            connection.setAutoCommit(AutoCommit);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void commit(){
        try {
            connection.commit();
            setConnection(true);
            ioUtil.println("commit success!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void endConnection(){
        try {
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int searchUid(String name){
        try{
            PreparedStatement preparedStatement = getPreparedStatement("select uid from t_user where uname = ?");
            preparedStatement.setString(1,name);
            ResultSet r = preparedStatement.executeQuery();
            while (r.next()){
                return r.getInt("uid");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean login(String name,String password){
        try {
            PreparedStatement preparedStatement = getPreparedStatement("select * from t_user where uname = ? and upassword = ?");
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,password);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                preparedStatement = getPreparedStatement("update t_user set ULASTTIME = now() where uname = ?");
//                preparedStatement.setString(1,StageUtil.getFormatDateTimeString());
                preparedStatement.setString(1,name);
                preparedStatement.execute();
                return true;
            }
        } catch (SQLException e) {
            e.getMessage();
            return false;
        }
        return false;
    }
    public boolean register(String name,String password){
        try {
            PreparedStatement preparedStatement = getPreparedStatement("select * from t_user where uname = ?");
            preparedStatement.setString(1,name);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                logger.info("has been registered1");
                return false;
            }
            preparedStatement = getPreparedStatement("INSERT INTO `t_user` (`UNAME`, `UPASSWORD`,`ULASTTIME`) VALUES (?, ?,now())");
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,password);
            preparedStatement.execute();
        } catch (SQLException e) {
//            e.getMessage();
            e.printStackTrace();
            return false;
        }
        return true;
    }
    public void modify(String uname, String pword) {
        try {
            PreparedStatement preparedStatement = getPreparedStatement("UPDATE t_user\n" +
                    "SET UPASSWORD = ? WHERE uname = ?");
            preparedStatement.setString(1,pword);
            preparedStatement.setString(2,uname);
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet quaryAllBook(String match) throws SQLException {
        PreparedStatement preparedStatement =getPreparedStatement("SELECT *\n" +
                "FROM t_book\n" +
                "where BID like CONCAT('%',?,'%') or BNAME like CONCAT('%',?,'%')or AUTHOR like CONCAT('%',?,'%')\n" +
                "limit 5;");
        preparedStatement.setString(1,match);
        preparedStatement.setString(2,match);
        preparedStatement.setString(3,match);
        return preparedStatement.executeQuery();
    }

    public  ResultSet quaryBookByMoney() throws SQLException {
        PreparedStatement preparedStatement = getPreparedStatement("SELECT\n" +
                "\tt_book.BID,\n" +
                "\tBNAME,\n" +
                "\tAUTHOR,\n" +
                "\tBTYPE,\n" +
                "\tBSTATE,\n" +
                "\tBINTRO,\n" +
                "\tBIMAGEURL,\n" +
                "\tMONEY\n" +
                "FROM\n" +
                "\tt_book\n" +
                "INNER JOIN t_reward ON t_book.BID = t_reward.BID\n" +
                "GROUP BY\n" +
                "\tt_book.BID,\n" +
                "\tBNAME,\n" +
                "\tAUTHOR,\n" +
                "\tBTYPE,\n" +
                "\tBSTATE,\n" +
                "\tBINTRO,\n" +
                "\tBIMAGEURL,\n" +
                "\tMONEY,\n" +
                "\tt_reward.BID\n" +
                "ORDER BY\n" +
                "\tSUM(MONEY) DESC\n" +
                "LIMIT 10;\n");
        return preparedStatement.executeQuery();
    }

    public ResultSet quaryRecBook(String uid) throws SQLException {
        PreparedStatement preparedStatement = getPreparedStatement("SELECT t_book.*\n" +
                "from t_rec INNER JOIN t_book on t_rec.BID = t_book.BID\n" +
                "where uid = '1' or uid = ?\n" +
                "ORDER BY t_rec.UID DESC\n" +
                "limit 10");
        preparedStatement.setString(1,uid);
        return preparedStatement.executeQuery();
    }

    public void addReading(String imageViewBid, int uid) {
        try {
            PreparedStatement preparedStatement = getPreparedStatement("INSERT INTO t_read VALUES(?,?,NOW(),0)");
            preparedStatement.setInt(1,uid);
            preparedStatement.setString(2,imageViewBid);
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet searchReadingBooks(int uid) throws SQLException {
        PreparedStatement preparedStatement = getPreparedStatement("SELECT\n" +
                "\tt_book.*\n" +
                "FROM\n" +
                "\tt_read\n" +
                "INNER JOIN t_book ON t_read.BID = t_book.BID\n" +
                "WHERE\n" +
                "\tuid = ?\n" +
                "AND READFLAG = 0");
        preparedStatement.setInt(1,uid);
        return preparedStatement.executeQuery();

    }

    public void addEvaluation(int uid, String bid, int value, String text) {
        try {
            PreparedStatement preparedStatement = getPreparedStatement("INSERT INTO t_eval\n" +
                    "VALUES\n" +
                    "\t(?, ?, ?, ?, now())");
            preparedStatement.setInt(1,uid);
            preparedStatement.setString(2,bid);
            preparedStatement.setInt(3,value);
            preparedStatement.setString(4,text==null?"":text);
            preparedStatement.execute();
            preparedStatement = getPreparedStatement("UPDATE `t_read`\n" +
                    "SET `READFLAG` = '1'\n" +
                    "WHERE\n" +
                    "\t(`UID` = ?)\n" +
                    "AND (`BID` = ?)");
            preparedStatement.setInt(1,uid);
            preparedStatement.setString(2,bid);
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet quaryEvabook(int uid, String bid) throws SQLException {
        PreparedStatement preparedStatement = getPreparedStatement("SELECT *\n" +
                "from t_eval\n" +
                "where UID = ? and BID = ?");
        preparedStatement.setInt(1,uid);
        preparedStatement.setString(2,bid);
        return preparedStatement.executeQuery();
    }

    public void updateEvaluation(int uid, String bid, int value, String text) {
        try {
            PreparedStatement preparedStatement =getPreparedStatement("UPDATE `t_eval`\n" +
                    "SET `EVANUM` = ?,\n" +
                    " `EVALUATION` = ?,\n" +
                    " `EVATIME` = NOW()\n" +
                    "WHERE\n" +
                    "\t(`UID` = ?)\n" +
                    "AND (`BID` = ?)");
            preparedStatement.setInt(1,value);
            preparedStatement.setString(2,text);
            preparedStatement.setInt(3,uid);
            preparedStatement.setString(4,bid);
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet searchEvaluationBooks(int uid) throws SQLException {
        PreparedStatement preparedStatement = getPreparedStatement("SELECT\n" +
                "\tt_book.*\n" +
                "FROM\n" +
                "\tt_eval\n" +
                "INNER JOIN t_book ON t_eval.bid = t_book.BID\n" +
                "WHERE\n" +
                "\tUID = ?");
        preparedStatement.setInt(1,uid);
        return preparedStatement.executeQuery();
    }

    public void addBook(Book book) {
        try {
            PreparedStatement preparedStatement = getPreparedStatement("INSERT t_book VALUES(?,?,?,?,?,?,?)");
            preparedStatement.setString(1,book.getBid());
            preparedStatement.setString(2,book.getBName());
            preparedStatement.setString(3,book.getBAuthor());
            preparedStatement.setString(4,book.getBType());
            preparedStatement.setString(5,book.getBStatus());
            preparedStatement.setString(6,book.getBIntro());
            preparedStatement.setString(7,book.getBImageUrl());
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean searchBid(String bid) {
        try{
            PreparedStatement preparedStatement =getPreparedStatement("SELECT *\n" +
                    "FROM t_book\n" +
                    "where BID = ?");
            preparedStatement.setString(1,bid);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public void updateReward(String bid){
        LinkedList<Pair<String,String>> reward = JsoupHelper.getNewReward(bid);
        try {
            PreparedStatement preparedStatement = getPreparedStatement("DELETE FROM t_reward where bid = ?\n;");
            preparedStatement.setString(1,bid);
            preparedStatement.execute();
            for(int i =0;i<reward.size();i++){
                preparedStatement = getPreparedStatement("INSERT INTO t_reward VALUES(?,?,?,NOW())");
                preparedStatement.setString(1,bid);
                preparedStatement.setString(2,reward.get(i).getKey());
                preparedStatement.setInt(3, Integer.parseInt(reward.get(i).getValue()));
                preparedStatement.execute();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return;
    }
    public ObservableList<RecommendBook> quaryRecBook(int uid) {
        ObservableList<RecommendBook> recommendBooks = FXCollections.observableArrayList();
        Map<String ,Integer> typeLike = getTypeMap();
        try {
            PreparedStatement preparedStatement = getPreparedStatement("SELECT t_book.BTYPE\n" +
                    "from t_eval INNER JOIN t_book on t_eval.BID = t_book.bid\n" +
                    "where UID = ?");
            preparedStatement.setInt(1,uid);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                int t = 0;
                String type = resultSet.getString(1);
                if(typeLike.get(type)!=null)
                    t = typeLike.get(type)+1;
                typeLike.put(type,t);
            }
            int sum = 0;
            for(Integer val:typeLike.values()){
                sum += val+1;
            }
            for(String key:typeLike.keySet()){
                int tmp = 10 * (typeLike.get(key)/sum)+1;
                preparedStatement = getPreparedStatement("SELECT t_book.*\n" +
                        "from t_book INNER JOIN t_reward on t_book.bid = t_reward.bid\n" +
                        "where t_book.BTYPE = ? and t_book.BID not in (SELECT bid from t_read where uid = ?)\n" +
                        "GROUP BY t_book.BID\n" +
                        "ORDER BY SUM(t_reward.MONEY) DESC\n" +
                        "limit ?");
                preparedStatement.setString(1,key);
                preparedStatement.setInt(2,uid);
                preparedStatement.setInt(3,tmp);
                resultSet = preparedStatement.executeQuery();
                while(resultSet.next()) {
                    RecommendBook recommendBook = new RecommendBook(
                            resultSet.getString("BID"),
                            resultSet.getString("BNAME"),
                            resultSet.getString("AUTHOR"),
                            resultSet.getString("BTYPE"),
                            resultSet.getString("BSTATE"),
                            resultSet.getString("BINTRO"),
                            resultSet.getString("BIMAGEURL"));
                    recommendBooks.add(recommendBook);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        updateRec(uid,recommendBooks);
        return recommendBooks;
    }

    public void updateRec(int uid, ObservableList<RecommendBook> recommendBooks) {
        try {
            PreparedStatement preparedStatement = getPreparedStatement("DELETE\n" +
                    "FROM\n" +
                    "\tt_rec\n" +
                    "WHERE\n" +
                    "\tuid = ?;");
            preparedStatement.setInt(1,uid);
            preparedStatement.execute();
            for(int i = 0;i<recommendBooks.size();i++){
                preparedStatement = getPreparedStatement("INSERT INTO t_rec(UID, BID,UPDATETIME)\n" +
                        "VALUES\n" +
                        "\t(\n" +
                        "\t\t?,\n" +
                        "\t\t?,\n" +
                        "\t\tNOW()\n" +
                        "\t);");
                preparedStatement.setInt(1,uid);
                preparedStatement.setString(2,recommendBooks.get(i).getBid());
                preparedStatement.execute();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Map<String,Integer> getTypeMap() {
        Map<String ,Integer> typeLike = new HashMap<String, Integer>();
        typeLike.put("玄幻-东方玄幻",0);
        typeLike.put("玄幻-异世大陆",0);
        typeLike.put("玄幻-王朝争霸",0);
        typeLike.put("玄幻-高武世界",0);

        typeLike.put("奇幻-史诗奇幻",0);
        typeLike.put("奇幻-剑与魔法",0);
        typeLike.put("奇幻-黑暗幻想",0);
        typeLike.put("奇幻-现代魔法",0);
        typeLike.put("奇幻-历史神话",0);
        typeLike.put("奇幻-另类幻想",0);

        typeLike.put("武侠-传统武侠",0);
        typeLike.put("武侠-国术无双",0);
        typeLike.put("武侠-武侠幻想",0);

        typeLike.put("仙侠-现代修真",0);
        typeLike.put("仙侠-修真文明",0);
        typeLike.put("仙侠-幻想修仙",0);
        typeLike.put("仙侠-神话修真",0);

        typeLike.put("都市-都市生活",0);
        typeLike.put("都市-爱情婚姻",0);
        typeLike.put("都市-异术超能",0);
        typeLike.put("都市-恩怨情仇",0);
        typeLike.put("都市-娱乐明星",0);
        typeLike.put("都市-青春校园",0);

        typeLike.put("现实-现实百态",0);
        typeLike.put("现实-爱情婚姻",0);
        typeLike.put("现实-社会乡土",0);

        typeLike.put("军事-军事战争",0);
        typeLike.put("军事-军旅生涯",0);
        typeLike.put("军事-抗战烽火",0);
        typeLike.put("军事-谍战特工",0);
        typeLike.put("军事-战争幻想",0);

        typeLike.put("历史-架空历史",0);
        typeLike.put("历史-秦汉三国",0);
        typeLike.put("历史-两晋隋唐",0);
        typeLike.put("历史-两宋元明",0);
        typeLike.put("历史-清史民国",0);
        typeLike.put("历史-外国历史",0);

        typeLike.put("游戏-游戏主播",0);
        typeLike.put("游戏-电子竞技",0);
        typeLike.put("游戏-虚拟网游",0);
        typeLike.put("游戏-游戏异界",0);

        typeLike.put("体育-体育赛事",0);
        typeLike.put("体育-足球运动",0);
        typeLike.put("体育-篮球运动",0);

        typeLike.put("科幻-星际文明",0);
        typeLike.put("科幻-古武机甲",0);
        typeLike.put("科幻-时空穿梭",0);
        typeLike.put("科幻-超级科技",0);
        typeLike.put("科幻-进化变异",0);
        typeLike.put("科幻-末世危机",0);
        typeLike.put("科幻-未来世界",0);

        typeLike.put("灵异-悬疑侦探",0);
        typeLike.put("灵异-恐怖惊悚",0);
        typeLike.put("灵异-寻墓探险",0);
        typeLike.put("灵异-灵异鬼怪",0);
        typeLike.put("灵异-风水秘术",0);
        return typeLike;
    }
}
