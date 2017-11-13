package cn.apprelease.pojo;

import java.util.Date;

/**
 * @author ligaoshan
 * 2017/11/7 8:33
 */
public class AppCategory {

    //主键ID
    private int id;
    //分类编码
    private String categoryCode;
    //分类名称
    private String categoryName;
    //代表几级分类，123分别代表123级
    private  Integer level;
    //父级节点id
    private int parentId;
    //创建者（来源于backend_user用户表的用户id）
    private int createdBy;
    //创建时间
    private Date creationTime;
    //更新者（来源于backend_user用户表的用户id）
    private  int modifyBy;
    //最新更新时间
    private Date modifyDate;

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

    public int getModifyBy() {
        return modifyBy;
    }

    public void setModifyBy(int modifyBy) {
        this.modifyBy = modifyBy;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }
}
