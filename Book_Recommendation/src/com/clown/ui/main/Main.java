package com.clown.ui.main;

import com.clown.Utils.SqlUtil;
import com.clown.Utils.StageUtil;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


public class Main extends Application {
    private static Logger logger = LogManager.getLogger(Main.class);
    @Override
    public void start(Stage primaryStage) throws Exception{
        SqlUtil.initConnect();
        Parent root = FXMLLoader.load(getClass().getResource("/com/clown/ui/login/login.fxml"));
        Scene scene = new Scene(root);
        primaryStage.setScene(scene);
        primaryStage.setTitle("Book Recommendation Login");
        primaryStage.show();
    }


    public static void main(String[] args) {
        Long startTime = System.currentTimeMillis();
        logger.info( "Library Assistant launched on {}", StageUtil.formatDateTimeString(startTime));
        launch(args);
        Runtime.getRuntime().addShutdownHook(new Thread() {
            @Override
            public void run() {
                Long exitTime = System.currentTimeMillis();
                logger.info("Library Assistant is closing on {}. Used for {} ms", StageUtil.formatDateTimeString(startTime), exitTime);
            }
        });
    }
}
