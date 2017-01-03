package com.example.adminis.listshowapplication;

/**
 * 水果的实体类
 * Created by Adminis on 2016/12/31.
 */

public class Fruit {
    private String nanme;
    private int imageId;
    public Fruit(String nanme,int imageId){
        this.nanme = nanme;
        this.imageId = imageId;
    }

    public int getImageId() {
        return imageId;
    }

    public String getNanme() {
        return nanme;
    }
}
