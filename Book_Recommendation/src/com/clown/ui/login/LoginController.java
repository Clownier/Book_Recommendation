package com.clown.ui.login;

import com.clown.Config.Preferences;
import com.clown.Utils.SqlUtil;
import com.clown.Utils.StageUtil;
import com.clown.alert.AlertMaker;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextField;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class LoginController implements Initializable {

    private final static Logger LOGGER = LogManager.getLogger(LoginController.class.getName());

    @FXML
    private JFXTextField username;
    @FXML
    private JFXPasswordField password;

    private Preferences preference;
    private SqlUtil sqlUtil;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        preference = Preferences.getPreferences();
        sqlUtil = new SqlUtil();
        username.setText(preference.getUsername());
        password.setText(preference.getUsername().equals("admin")?"admin":"");
    }

    @FXML
    private void handleLoginButtonAction(ActionEvent event) {
        String uname = username.getText();
        String pword = DigestUtils.sha1Hex(password.getText());
        if(sqlUtil.login(uname,pword)){
            if(uname.equals("admin")){
                AlertMaker.showSimpleAlert("Info","Please note that you are using a public tourist account. If you need to save data, please registration after restart.");
            }else if(!uname.equals(preference.getUsername())){
                preference.setPassword(password.getText());
                preference.setUsername(uname);
                Preferences.writePreferenceToFile(preference);
            }
            loadMain();
        }
        else {
            username.getStyleClass().add("wrong-credentials");
            password.getStyleClass().add("wrong-credentials");
        }
    }

    @FXML
    private void handleRegisterButtonAction(ActionEvent event) {
        String uname = username.getText();
        String pword = DigestUtils.sha1Hex(password.getText());
        if(sqlUtil.register(uname,pword)){
            preference.setPassword(password.getText());
            preference.setUsername(uname);
            Preferences.writePreferenceToFile(preference);
            loadMain();
        }
        else {
            AlertMaker.showErrorMessage("This username is already taken.","Please try another username.");
            username.getStyleClass().add("wrong-credentials");
        }
    }
    @FXML
    private void handleCancelButtonAction(ActionEvent event) {
        System.exit(0);
    }

    private void closeStage() {
        ((Stage) username.getScene().getWindow()).close();
    }

    void loadMain() {
        closeStage();
        LOGGER.log(Level.INFO, "User successfully logged in {}", username.getText());
        StageUtil.loadWindow(getClass().getResource("/com/clown/ui/main/sample.fxml"),"Library Assistant",new Stage(StageStyle.DECORATED));
//        try {
//            Parent parent = FXMLLoader.load(getClass().getResource("/com/clown/ui/main/sample.fxml"));
//            Stage stage = new Stage(StageStyle.DECORATED);
//            stage.setTitle("Library Assistant");
//            stage.setScene(new Scene(parent));
//            stage.show();
//            StageUtil.setStageIcon(stage);
//        }
//        catch (IOException ex) {
//            LOGGER.log(Level.ERROR, "{}", ex);
//        }
    }

}
