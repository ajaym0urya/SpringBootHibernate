package com.ajax.procat;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.springframework.transaction.annotation.Transactional;
import org.hibernate.resource.transaction.spi.TransactionStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ProductController {

    Configuration con = new Configuration().configure().addAnnotatedClass(Product.class).addAnnotatedClass(Category.class);
    SessionFactory sf = con.buildSessionFactory();
    Session session = sf.openSession();

    @RequestMapping(value = {"/", "/product"})
    public ModelAndView product() {

        Transaction tx = session.beginTransaction();
        ModelAndView mv = new ModelAndView();
        mv.setViewName("product");
        Query q = session.createQuery("select p.pname,p.pdesp,p.pprice,p.id,p.category from Product p");
        List<Object[]> prod = (ArrayList<Object[]>) q.list();
        mv.addObject("prod", prod);
        if (tx.getStatus().equals(TransactionStatus.ACTIVE)) {
            tx.commit();
        }
        return mv;
    }

    @Transactional
    @PostMapping("/addproduct")
    public String addProduct(@RequestParam("pname") String name, @RequestParam("pdesp") String desp, @RequestParam("pprice") Integer price, @RequestParam("select") int select) {

        Transaction tx = session.beginTransaction();
        SQLQuery q = session.createSQLQuery("insert into Product (Name,Description,Price,category_Id) values('" + name + "','" + desp + "'," + price + "," + select + ")");
        q.executeUpdate();
        if (tx.getStatus().equals(TransactionStatus.ACTIVE)) {
            tx.commit();
        }
        return "<html><body><script>alert(\"Product Added\");location.replace(\"/\")</script></body></html>";
    }

    @Transactional
    @GetMapping(value = "/{id}")
    public String deleteProduct(@PathVariable("id") int id) {

        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("delete from Product p where p.id=:id");
        q.setParameter("id", id);
        q.executeUpdate();
        if (tx.getStatus().equals(TransactionStatus.ACTIVE)) {
            tx.commit();
        }
        return "<html><body onload=\"\"><script>alert(\"Product Deleted\");location.replace(\"/\")</script></body></html>";
    }

    @GetMapping(value = "/updateproduct/{id}")
    public ModelAndView updateCategory(@PathVariable("id") int id) {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("updateproduct");
        Transaction tx = session.beginTransaction();

        Query qselect = session.createQuery("select p.pname,p.pdesp,p.pprice,p.id,p.category from Product p where p.id=:id");

        qselect.setParameter("id", id);
        Object prodd = (Object) qselect.uniqueResult();
        mv.addObject("prodd", prodd);

        if (tx.getStatus().equals(TransactionStatus.ACTIVE)) {
            tx.commit();
        }
        return mv;

    }

    @PostMapping("/uproduct/{id}")
    public String uProduct(@RequestParam("pname") String name, @RequestParam("pdesp") String desp, @RequestParam("pprice") Integer price, @PathVariable("id") int id) {

        Transaction tx = session.beginTransaction();
        Query qupdate = session.createQuery("update Product p set p.pname=:name,p.pdesp=:desp,p.pprice=:price where p.id=:id");
        //Query qupdate = session.createQuery("update Product p set p.pname=:name,p.pdesp=:desp,p.pprice=:price,p.category:select where p.id=:id");
        qupdate.setParameter("name", name);
        qupdate.setParameter("desp", desp);
        qupdate.setParameter("price", price);
        //   qupdate.setParameter("select", select);
        qupdate.setParameter("id", id);
        qupdate.executeUpdate();
        if (tx.getStatus().equals(TransactionStatus.ACTIVE)) {
            tx.commit();
        }
        return "<html><body><script>alert(\"Product Updated\");location.replace(\"/\")</script></body></html>";
    }
}
