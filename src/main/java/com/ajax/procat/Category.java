package com.ajax.procat;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
@Entity
public class Category {
    @Id
    @Column(name = "Id")
    private int id;
    @Column(name = "Categories")
    private String cat;
    @OneToMany
    private List<Product> product = new ArrayList<Product>();
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getCat() {
        return cat;
    }
    public void setCat(String cat) {
        this.cat = cat;
    }
    @Override
    public String toString() {
        return "Category{" + "id=" + id + ", cat=" + cat + '}';
    }
    public List<Product> getProduct() {
        return product;
    }
    public void setProduct(List<Product> product) {
        this.product = product;
    }
}
