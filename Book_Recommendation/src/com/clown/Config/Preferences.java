package com.clown.Config;

import com.clown.alert.AlertMaker;
import com.google.gson.Gson;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.logging.log4j.LogManager;

import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Preferences {
    private final static org.apache.logging.log4j.Logger LOGGER = LogManager.getLogger(Preferences.class.getName());
    public static final String CONFIG_FILE = "config.txt";
    String username;
    String password;

    public Preferences() {
        username = "admin";
        setPassword("admin");
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        if (password.length() < 16) {
            this.password = DigestUtils.sha1Hex(password);
        }else
            this.password = password;
    }
    public static void initConfig() {
        Writer writer = null;
        try {
            Preferences preference = new Preferences();
            Gson gson = new Gson();
            writer = new FileWriter(CONFIG_FILE);
            gson.toJson(preference, writer);
        } catch (IOException ex) {
            LOGGER.fatal(ex.getMessage());
        } finally {
            try {
                writer.close();
            } catch (Exception ex) {
                LOGGER.fatal(ex.getMessage());
            }
        }
    }

    public static Preferences getPreferences() {
        Gson gson = new Gson();
        Preferences preferences = new Preferences();
        try {
            preferences = gson.fromJson(new FileReader(CONFIG_FILE), Preferences.class);
        } catch (FileNotFoundException ex) {
            initConfig();
            LOGGER.info(ex.getMessage());
        }
        return preferences;
    }

    public static void writePreferenceToFile(Preferences preference) {
        Writer writer = null;
        try {
            Gson gson = new Gson();
            writer = new FileWriter(CONFIG_FILE);
            gson.toJson(preference, writer);

            AlertMaker.showSimpleAlert("Success", "Settings updated");
        } catch (IOException ex) {
            LOGGER.warn(ex.getMessage());
            AlertMaker.showErrorMessage(ex, "Failed", "Cant save configuration file");
        } finally {
            try {
                writer.close();
            } catch (IOException ex) {
                LOGGER.fatal(ex.getMessage());
            }
        }
    }
}
