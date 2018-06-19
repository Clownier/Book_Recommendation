package com.clown.ui.modify;

import com.clown.Config.Preferences;
import com.clown.Utils.SqlUtil;
import com.clown.alert.AlertMaker;
import com.clown.ui.login.LoginController;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextField;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.stage.Stage;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.net.URL;
import java.util.ResourceBundle;

public class modifyController  implements Initializable {
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
        username.setDisable(true);

    }
    public void handleModifyButtonAction(ActionEvent actionEvent) {
        String uname = username.getText();
        String pword = DigestUtils.sha1Hex(password.getText());
        sqlUtil.modify(uname,pword);
        AlertMaker.showSimpleAlert("Info","You have successfully modified your password");
        closeStage();

    }

    public void handleCancelButtonAction(ActionEvent actionEvent) {
        closeStage();
    }
    private void closeStage() {
        ((Stage) username.getScene().getWindow()).close();
    }
}
