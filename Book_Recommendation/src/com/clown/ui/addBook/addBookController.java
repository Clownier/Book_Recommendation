package com.clown.ui.addBook;

import com.clown.Modules.Book;
import com.clown.Spider.JsoupHelper;
import com.clown.Utils.SqlUtil;
import com.clown.alert.AlertMaker;
import com.clown.ui.login.LoginController;
import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextField;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.Initializable;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.awt.*;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ResourceBundle;

public class addBookController implements Initializable {
    private final static Logger LOGGER = LogManager.getLogger(addBookController.class.getName());
    public ImageView imageView;
    public JFXTextField addbidTextField;
    public JFXButton commitButton;

    private SqlUtil sqlUtil;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        sqlUtil = new SqlUtil();
        Image image = new Image("/resources/example.png");
        imageView.setImage(image);

    }

    public void handleImageView(MouseEvent mouseEvent) {
        try {
            URI imageViewUri = new URI("https://www.qidian.com/search");
            Desktop.getDesktop().browse(imageViewUri);
        } catch (IOException | URISyntaxException e) {
            e.printStackTrace();
        }
    }

    public void handleCommitButton(ActionEvent actionEvent) {
        Platform.runLater(new Runnable() {
            @Override
            public void run() {
                if(sqlUtil.searchBid(addbidTextField.getText())){
                    AlertMaker.showErrorMessage("Error","This book is already in the database");
                }
                else {
                    try {
                        Book book = JsoupHelper.getNewBook(addbidTextField.getText());
                        if (AlertMaker.showConfirmDialog("Confirm Book Infromation", book.toString())) {
                            sqlUtil.addBook(book);
                            AlertMaker.showSimpleAlert("Success!","感谢您为本系统做出的贡献!\nThank you for your contribution to this system");
                        }
                        else
                            return;
                    } catch (Exception e) {
                        AlertMaker.showErrorMessage(e, "Error", "Input Bid error! Please fill in follow the illustration");
                    }
                }
                ((Stage) addbidTextField.getScene().getWindow()).close();
            }
        });
//        new Thread(new Runnable() {
//            @Override
//            public void run() {
//
//            }
//        }).start();
    }
}
