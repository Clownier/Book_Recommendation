package com.clown.ui.main;

import com.clown.Config.Preferences;
import com.clown.Modules.Book;
import com.clown.Modules.RecommendBook;
import com.clown.Utils.SqlUtil;
import com.clown.Utils.StageUtil;
import com.clown.alert.AlertMaker;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXMasonryPane;
import com.jfoenix.controls.JFXScrollPane;
import com.jfoenix.controls.JFXTextArea;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Pos;
import javafx.scene.control.*;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import javafx.util.Callback;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.awt.*;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.ResourceBundle;

public class MainController implements Initializable{
    private static Logger logger = LogManager.getLogger(MainController.class);
    public TableColumn<RecommendBook,String> recCol1;
    public TableColumn<RecommendBook,String> recCol2;
    public TableColumn<RecommendBook,String> recCol3;
    public TableColumn<RecommendBook,String> recCol4;
    public TableColumn<RecommendBook,String> recCol5;
    public TableColumn<RecommendBook,String> recCol6;
    public TableColumn<RecommendBook,String> recCol7;
    public TableView<RecommendBook> recommendTableView;
    public ObservableList<RecommendBook> recommendBooks = FXCollections.observableArrayList();
    public JFXComboBox<String> searchComboBox;
    public ObservableList<Book> searchbooks = FXCollections.observableArrayList();
    public ObservableList<Book> readingBooks = FXCollections.observableArrayList();
    public ObservableList<Book> evaluationBooks = FXCollections.observableArrayList();

    @FXML
    public ImageView bookImageView;
    public Text preViewText1;
    public Text preViewText2;
    public Text preViewText3;
    public Text preViewText4;
    public Text preViewText5;
    public Text preViewText6;
    public JFXTextArea preViewTextArea;
    public TextArea preViewTextArea1;
    public TextField preViewTextField;
    public String imageViewBid;
    public Tab ReadingTab;
    public Tab EvaluateTab;
    public static Book currentBook;
    boolean refleshRecBook = true;
    private SqlUtil sqlUtil;
    final int Uid;
    {
        this.sqlUtil = new SqlUtil();
        Uid = sqlUtil.searchUid(Preferences.getPreferences().getUsername());
    }
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        initSearchComboBox();
        initRecommendBook();
        logger.info("uid is "+Uid);
    }

    public void EvaluateTabChanged(Event event) {
        logger.info("EvaluationTab");
        initEvaluationBook();
    }

    private void initEvaluationBook() {
        JFXMasonryPane masonryPane = new JFXMasonryPane();
        evaluationBooks.clear();
        try {
            ResultSet resultSet = sqlUtil.searchEvaluationBooks(Uid);
            while(resultSet.next()){
                Book book = new Book(
                        resultSet.getString("BID"),
                        resultSet.getString("BNAME"),
                        resultSet.getString("AUTHOR"),
                        resultSet.getString("BTYPE"),
                        resultSet.getString("BSTATE"),
                        resultSet.getString("BINTRO"),
                        resultSet.getString("BIMAGEURL"));
                evaluationBooks.add(book);
                Button button = new Button(book.getBName()+"--"+book.getBAuthor());
                //button.setStyle("-fx-background-color : rgb("+r.nextInt(255)+","+r.nextInt(255)+","+r.nextInt(255)+")");
                button.setOnMouseClicked(new EventHandler<MouseEvent>() {
                    @Override
                    public void handle(MouseEvent event) {
                        currentBook = book;
                        logger.info(currentBook.getBName());
                        StageUtil.loadWindow(getClass().getResource("/com/clown/ui/evaluation/evaluation.fxml"),"Evaluation",new Stage(StageStyle.DECORATED));
//                        initReadingBook();
                    }
                });
                masonryPane.getChildren().add(button);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        EvaluateTab.setContent(masonryPane);
    }

    public void ReadingTabChanged(Event event) {
        logger.info("ReadingTab"+event.toString());
        initReadingBook();
    }

    private void initReadingBook() {
        JFXMasonryPane masonryPaneReading = new JFXMasonryPane();
        readingBooks.clear();
        try {
            ResultSet resultSet = sqlUtil.searchReadingBooks(Uid);
            while(resultSet.next()){
                Book book = new Book(
                        resultSet.getString("BID"),
                        resultSet.getString("BNAME"),
                        resultSet.getString("AUTHOR"),
                        resultSet.getString("BTYPE"),
                        resultSet.getString("BSTATE"),
                        resultSet.getString("BINTRO"),
                        resultSet.getString("BIMAGEURL"));
                readingBooks.add(book);
                Button button = new Button(book.getBName()+"--"+book.getBAuthor());
                //button.setStyle("-fx-background-color : rgb("+r.nextInt(255)+","+r.nextInt(255)+","+r.nextInt(255)+")");
                button.setOnMouseClicked(new EventHandler<MouseEvent>() {
                    @Override
                    public void handle(MouseEvent event) {
                        currentBook = book;
                        logger.info(currentBook.getBName());
                        StageUtil.loadWindow(getClass().getResource("/com/clown/ui/evaluation/evaluation.fxml"),"Evaluation",new Stage(StageStyle.DECORATED));
                        initReadingBook();
                    }
                });
                masonryPaneReading.getChildren().add(button);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //masonryPaneReading.getChildren().add(new Button("lkjl"));
        ReadingTab.setContent(masonryPaneReading);
    }

    public void searchRecTabChanged(Event event) {
        logger.info("searchTab "+recommendBooks.size());
        refreshSearchComboBox("");
        refreshRecommendBook();
        searchComboBox.hide();
    }

    private void initSearchComboBox() {
        searchComboBox.getEditor().focusedProperty().addListener(new ChangeListener<Boolean>() {
            @Override
            public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
                if(!oldValue && newValue){
                    searchComboBox.show();
                }
            }
        });
        searchComboBox.valueProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
                if(newValue == null)
                    return;
                for(int i = 0;i<searchbooks.size();i++){
                    if(newValue.contains(searchbooks.get(i).getBName()+"--")) {
                        setPreviewVBox(searchbooks.get(i));
                        return;
                    }
                }
            }
        });
        searchComboBox.setOnKeyReleased(new EventHandler<KeyEvent>() {
            @Override
            public void handle(KeyEvent event) {
                refreshSearchComboBox(searchComboBox.getEditor().getText());
            }
        });
        //refreshSearchComboBox("");
    }

    private void refreshSearchComboBox(String s) {
        logger.info("searchComboxBox refresh : "+s);
        searchComboBox.show();
        searchComboBox.getItems().clear();
        searchbooks.clear();
        if(s.equals(""))
            return;
        try {
            ResultSet resultSet = this.sqlUtil.quaryAllBook(s);
            while(resultSet.next()){
                Book book = new Book(
                    resultSet.getString("BID"),
                    resultSet.getString("BNAME"),
                    resultSet.getString("AUTHOR"),
                    resultSet.getString("BTYPE"),
                    resultSet.getString("BSTATE"),
                    resultSet.getString("BINTRO"),
                    resultSet.getString("BIMAGEURL"));
                searchbooks.add(book);
                String item = resultSet.getString("BNAME")+"--"+resultSet.getString("AUTHOR")+"--"+resultSet.getString("BTYPE");
                searchComboBox.getItems().add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void initRecommendBook() {
        recommendTableView.setColumnResizePolicy(TableView.CONSTRAINED_RESIZE_POLICY);
        recCol1.setCellValueFactory(new PropertyValueFactory<RecommendBook,String>("BName"));
        recCol1.setText("书名");
        recCol2.setCellValueFactory(new PropertyValueFactory<RecommendBook,String>("BAuthor"));
        recCol2.setText("作者");
        recCol3.setCellValueFactory(new PropertyValueFactory<RecommendBook,String>("BType"));
        recCol3.setText("类型");
        recCol4.setCellValueFactory(new PropertyValueFactory<RecommendBook,String>("BStatus"));
        recCol4.setText("状态");
        recCol5.setCellValueFactory(new PropertyValueFactory<RecommendBook,String>("BIntro"));
        recCol5.setText("简介");
        recCol5.setVisible(false);
        recCol6.setCellFactory(new Callback<TableColumn<RecommendBook, String>, TableCell<RecommendBook, String>>() {
            @Override
            public TableCell<RecommendBook, String> call(TableColumn<RecommendBook, String> col) {
                TableCell<RecommendBook, String> cell = new TableCell<RecommendBook, String>() {
                    @Override
                    protected void updateItem(String item, boolean empty) {
                        super.updateItem(item, empty);
                        this.setText(null);
                        this.setGraphic(null);
                        if (!empty) {
                            Button button = new Button("预览");
                            this.setGraphic(button);
                            button.setOnMouseClicked((MouseEvent me) -> {
                                RecommendBook recommendBook = this.getTableView().getItems().get(this.getIndex());
                                setPreviewVBox(recommendBook);
                                logger.info(recommendBook.toString());
                            });
                        }
                    }
                };
                return cell;
            }
        });
        recCol7.setVisible(false);
        recommendTableView.setItems(recommendBooks);
        //refreshRecommendBook();
    }

    private void setPreviewVBox(Book book) {
        Image image = new Image(book.getBImageUrl(),true);
        bookImageView.setImage(image);
        imageViewBid = book.getBid();
        preViewText1.setText(book.getBName()+"--"+book.getBAuthor());
        preViewText1.setFont(Font.font(30));
        preViewText2.setText(book.getBStatus()+"--"+book.getBStatus());
        preViewText2.setFont(Font.font(20));
        preViewText3.setWrappingWidth(450);
        preViewText3.setText(book.getBIntro()+"......");
        preViewText3.setFont(Font.font(20));
        preViewTextArea.setVisible(false);
        preViewTextArea1.setVisible(false);
        preViewTextField.setVisible(false);
//        preViewText3.setVisible(false);
        preViewText4.setVisible(false);
        preViewText5.setVisible(false);
        preViewText6.setVisible(false);
    }

    private void refreshRecommendBook() {
        if(!refleshRecBook){
            return;
        }
        logger.info("refreshRecommendBook");
        new Thread(new Runnable() {
            @Override
            public void run() {
                recommendBooks.clear();
                recommendBooks.addAll(sqlUtil.quaryRecBook(Uid));
                setPreviewVBox(recommendBooks.get(0));
                recommendTableView.refresh();
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        sqlUtil.updateRec(Uid,recommendBooks);
                        logger.info("updateRec:"+recommendBooks.size());
                    }
                }).start();
            }
        }).start();
        refleshRecBook = false;
    }

    public void onMouseClickedImage(MouseEvent mouseEvent) {
         try {
            URI imageViewUri = new URI("https://book.qidian.com/info/"+imageViewBid);
            Desktop.getDesktop().browse(imageViewUri);
            new Thread(new Runnable() {
                @Override
                public void run() {
                    sqlUtil.addReading(imageViewBid,Uid);
                    sqlUtil.updateReward(imageViewBid);
                }
            }).start();
             refleshRecBook = true;
        } catch (IOException e) {
            e.printStackTrace();
        }catch (URISyntaxException e) {
            e.printStackTrace();
        }
    }

    public void handleModify(ActionEvent actionEvent) {
        StageUtil.loadWindow(getClass().getResource("/com/clown/ui/modify/modify.fxml"),"Book Recommendation",new Stage(StageStyle.DECORATED));
    }

    public void handleExit(ActionEvent actionEvent) {
        ((Stage) recommendTableView.getScene().getWindow()).close();
    }

    public void handleAddBook(ActionEvent actionEvent) {
        StageUtil.loadWindow(getClass().getResource("/com/clown/ui/addBook/addBook.fxml"),"Book Recommendation",new Stage(StageStyle.DECORATED));
    }

    public void handleAbout(ActionEvent actionEvent) {
        AlertMaker.showSimpleAlert("About","Author:李培昊 ");
    }
}
