package com.clown.Utils;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.swing.*;
import java.sql.*;


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

    public void updateReturn(String number) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = getPreparedStatement("UPDATE t_ghxx\n" +
                    "set THBZ = TRUE\n" +
                    "where GHBH = ?");
            preparedStatement.setString(1,number);
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet querySpecies(String id) throws SQLException {
        PreparedStatement preparedStatement = getPreparedStatement("SELECT\n" +
                "t_ghxx.GHBH,\n" +
                "t_ghxx.HZBH,\n" +
                "t_ghxx.YSBH,\n" +
                "t_ksys.YSMC,\n" +
                "t_ghxx.GHFY,\n" +
                "t_ghxx.THBZ,\n" +
                "t_ghxx.RQSJ\n" +
                "FROM\n" +
                "t_ghxx ,\n" +
                "t_ksys\n" +
                "WHERE\n" +
                "t_ghxx.YSBH = t_ksys.YSBH AND\n" +
                "t_ghxx.BRBH = ?\n");
        preparedStatement.setString(1,id);
        return preparedStatement.executeQuery();
    }
    public ResultSet queryPatient(String id) throws SQLException{
        PreparedStatement preparedStatement = getPreparedStatement("SELECT\n" +
                "t_ghxx.GHBH,\n" +
                "t_brxx.BRMC,\n" +
                "t_ghxx.RQSJ,\n" +
                "t_hzxx.SFZJ\n" +
                "FROM\n" +
                "t_ghxx ,\n" +
                "t_brxx ,\n" +
                "t_hzxx\n" +
                "WHERE\n" +
                "t_ghxx.BRBH = t_brxx.BRBH AND\n" +
                "t_ghxx.HZBH = t_hzxx.HZBH AND\n" +
                "t_ghxx.THBZ = 0 AND\n" +
                "t_ghxx.YSBH = ?\n");
        preparedStatement.setString(1,id);
        return preparedStatement.executeQuery();
    }
    public ResultSet queryDoctor(String start,String end) throws SQLException{
        PreparedStatement preparedStatement = getPreparedStatement("SELECT\n" +
                "t_ksxx.KSMC,\n" +
                "t_ksys.YSBH,\n" +
                "t_ksys.YSMC,\n" +
                "t_hzxx.SFZJ,\n" +
                "count(*),\n" +
                "SUM(t_ghxx.GHFY)\n" +
                "FROM\n" +
                "t_ghxx ,\n" +
                "t_ksys\n" +
                "INNER JOIN t_ksxx ON t_ksys.KSBH = t_ksxx.KSBH\n" +
                "INNER JOIN t_hzxx ON t_hzxx.KSBH = t_ksxx.KSBH\n" +
                "WHERE\n" +
                "t_ghxx.YSBH = t_ksys.YSBH AND\n" +
                "t_ghxx.HZBH = t_hzxx.HZBH AND\n" +
                "t_ghxx.THBZ = 0 AND\n" +
                "t_ghxx.RQSJ >= ? AND\n" +
                "t_ghxx.RQSJ <= ?\n" +
                "GROUP BY\n" +
                "t_ksxx.KSMC,\n" +
                "t_ksys.YSBH,\n" +
                "t_ksys.YSMC,\n" +
                "t_hzxx.SFZJ\n");
        preparedStatement.setString(1,start);
        preparedStatement.setString(2,end);
        return preparedStatement.executeQuery();
    }

    public boolean login(String name,String password){
        try {
            PreparedStatement preparedStatement = getPreparedStatement("select * from userinfo where uname = ? and upassword = ?");
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,password);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                preparedStatement = getPreparedStatement("update userinfo set lastlogin = ? where uname = ?");
                preparedStatement.setString(1,StageUtil.getFormatDateTimeString());
                preparedStatement.setString(2,name);
                preparedStatement.execute();
                return true;
            }
        } catch (SQLException e) {
            logger.fatal(e.getMessage());
            return false;
        }
        return false;
    }
    public boolean register(String name,String password){
        try {
            PreparedStatement preparedStatement = getPreparedStatement("select * from userinfo where uname = ?");
            preparedStatement.setString(1,name);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                return false;
            }
            preparedStatement = getPreparedStatement("INSERT INTO `userinfo` (`UNAME`, `UPASSWORD`,`LASTLOGIN`) VALUES (?, ?,?)");
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,password);
            preparedStatement.setString(3,StageUtil.getFormatDateTimeString());
            preparedStatement.execute();
        } catch (SQLException e) {
            logger.fatal(e.getMessage());
            return false;
        }
        return true;
    }
}
