package com.ajax.procat;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
@Entity
public class Product {
    @Id
    @Column(name="Id")
    private int id;
    @Column(name="Name")
    private String pname;
    @Column(name="Description")
    private String pdesp;
    @Column(name="Price")
    private int pprice;
    @OneToOne()
    private Category category;
   
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getPname() {
        return pname;
    }
    public void setPname(String pname) {
        this.pname = pname;
    }
    public String getPdesp() {
        return pdesp;
    }
    public void setPdesp(String pdesp) {
        this.pdesp = pdesp;
    }
    public int getPprice() {
        return pprice;
    }
    public void setPprice(int pprice) {
        this.pprice = pprice;
    }
    public Category getCategory() {
        return category;
    }
    public void setCategory(Category category) {
        this.category = category;
    }
    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", pname=" + pname + ", pdesp=" + pdesp + ", pprice=" + pprice + '}';
    }
    
}
