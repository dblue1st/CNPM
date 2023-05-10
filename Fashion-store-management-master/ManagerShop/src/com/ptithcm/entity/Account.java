/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ptithcm.entity;

/**
 *
 * @author minht
 */


public class Account {

    private int idUser;
    private String UserName;
    private String PassWord;

    public Account() {
    }
    

    public Account(String UserName, String PassWord) {
        this.UserName = UserName;
        this.PassWord = PassWord;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    
    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getPassWord() {
        return PassWord;
    }

    public void setPassWord(String PassWord) {
        this.PassWord = PassWord;
    }
}
