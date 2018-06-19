package com.clown.ui.evaluation;

import com.clown.Config.Preferences;
import com.clown.Modules.Book;
import com.clown.Utils.SqlUtil;
import com.clown.ui.main.MainController;
import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXSlider;
import com.jfoenix.controls.JFXTextArea;
import com.jfoenix.controls.JFXTextField;
import de.jensd.fx.glyphs.fontawesome.FontAwesomeIconView;
import javafx.event.ActionEvent;
import javafx.fxml.Initializable;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.stage.Stage;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class EvaController implements Initializable {
    private static Logger logger = LogManager.getLogger(EvaController.class);
    public ImageView evaluationImageView;
    public JFXSlider evaluationJFXSlider;
    public JFXTextArea evaluationJFXTextArea;
    public JFXButton evaluationButtion;
    public JFXTextField evaluationDate;
    public FontAwesomeIconView evaluationDateView;
    boolean hasEva;
    private Book mybook;
    private SqlUtil sqlUtil;
    final int Uid;
    {
        this.sqlUtil = new SqlUtil();
        Uid = sqlUtil.searchUid(Preferences.getPreferences().getUsername());
    }
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        mybook = MainController.currentBook;
        Image image = new Image(mybook.getBImageUrl());
        evaluationImageView.setImage(image);
        try {
            ResultSet resultSet = sqlUtil.quaryEvabook(Uid,mybook.getBid());
            if(resultSet.next()){
                evaluationJFXTextArea.setText(resultSet.getString("EVALUATION"));
                evaluationJFXSlider.setValue(resultSet.getInt("EVANUM"));
                evaluationButtion.setText("修改");
                evaluationDateView.setVisible(true);
                evaluationDate.setVisible(true);
                evaluationDate.setText(resultSet.getString("EVATIME"));
                hasEva = true;
            }else {
                hasEva = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void ensureButtonAction(ActionEvent actionEvent) {
        if(hasEva){
            sqlUtil.updateEvaluation(Uid,mybook.getBid(),(int)evaluationJFXSlider.getValue(),evaluationJFXTextArea.getText());
        }else{
            sqlUtil.addEvaluation(Uid,mybook.getBid(),(int)evaluationJFXSlider.getValue(),evaluationJFXTextArea.getText());
        }
        ((Stage) evaluationJFXTextArea.getScene().getWindow()).close();
    }
}
