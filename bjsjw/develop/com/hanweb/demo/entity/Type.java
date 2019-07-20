package com.hanweb.demo.entity;

import java.util.Date;

import com.hanweb.common.annotation.Column;
import com.hanweb.common.annotation.ColumnType;
import com.hanweb.common.annotation.Id;
import com.hanweb.common.annotation.Table;
import com.hanweb.demo.constant.Tables;

@Table(name = Tables.TYPE)
public class Type {

    @Id
    @Column(type = ColumnType.INT)
    private Integer integer_field;
    
    @Column(type = ColumnType.FLOAT)
    private Float single_field;
    
    @Column(type = ColumnType.DOUBLE)
    private Double both_field;
    
    @Column(type = ColumnType.CHAR)
    private String character_field;
    
    @Column(type = ColumnType.VARCHAR)
    private String string_field;
    
    @Column(type = ColumnType.INT)
    private Boolean judge_field;
    
    @Column(type = ColumnType.DATE)
    private Date date_field;
    
    @Column(type = ColumnType.DATETIME)
    private Date datetime_field;
    
    @Column(type = ColumnType.JSON)
    private String json_field;
    
    @Column(type = ColumnType.TEXT)
    private String text_field;

    @Column(type = ColumnType.BLOB, update = false)
    private byte[] blob_field;
    
    public Integer getInteger_field() {
        return integer_field;
    }

    public void setInteger_field(Integer integer_field) {
        this.integer_field = integer_field;
    }

    public Float getSingle_field() {
        return single_field;
    }

    public void setSingle_field(Float single_field) {
        this.single_field = single_field;
    }

    public Double getBoth_field() {
        return both_field;
    }

    public void setBoth_field(Double both_field) {
        this.both_field = both_field;
    }

    public String getCharacter_field() {
        return character_field;
    }

    public void setCharacter_field(String character_field) {
        this.character_field = character_field;
    }

    public String getString_field() {
        return string_field;
    }

    public void setString_field(String string_field) {
        this.string_field = string_field;
    }

    public Boolean getJudge_field() {
        return judge_field;
    }

    public void setJudge_field(Boolean judge_field) {
        this.judge_field = judge_field;
    }

    public Date getDate_field() {
        return date_field;
    }

    public void setDate_field(Date date_field) {
        this.date_field = date_field;
    }

    public Date getDatetime_field() {
        return datetime_field;
    }

    public void setDatetime_field(Date datetime_field) {
        this.datetime_field = datetime_field;
    }

    public String getJson_field() {
        return json_field;
    }

    public void setJson_field(String json_field) {
        this.json_field = json_field;
    }

    public String getText_field() {
        return text_field;
    }

    public void setText_field(String text_field) {
        this.text_field = text_field;
    }

    public byte[] getBlob_field() {
        return blob_field;
    }

    public void setBlob_field(byte[] blob_field) {
        this.blob_field = blob_field;
    };

}
