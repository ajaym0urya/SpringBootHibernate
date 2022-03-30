package com.ajax.procat;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.hibernate.resource.transaction.spi.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class CategoryController {

    Configuration con = new Configuration().configure().addAnnotatedClass(Category.class).addAnnotatedClass(Product.class);
    SessionFactory sf = con.buildSessionFactory();
    Session session = sf.openSession();

    @RequestMapping("/category")
    public ModelAndView category() {

        Transaction tx = session.beginTransaction();
        ModelAndView mv = new ModelAndView();
        mv.setViewName("category");
        Query q = session.createQuery("select c.cat,c.id from Category c");
        List<Object[]> cat = (ArrayList<Object[]>) q.list();
        mv.addObject("cat", cat);

        if (tx.getStatus().equals(TransactionStatus.ACTIVE)) {
            tx.commit();
        }
        return mv;
    }

    @GetMapping(value = "/updatecategory/{id}")
    public ModelAndView updateCategory(@PathVariable("id") int id) {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("updatecategory");
        Transaction tx = session.beginTransaction();
        Query qselect = session.createQuery("select c.cat,c.id from Category c where c.id=:id");
        qselect.setParameter("id", id);
        Object cat1 = (Object) qselect.uniqueResult();
        mv.addObject("cat1", cat1);
        if (tx.getStatus().equals(TransactionStatus.ACTIVE)) {
            tx.commit();
        }
        return mv;
    }

    @PostMapping("/ucategory/{id}")
    public String uCategory(@RequestParam("cat") String cat, @PathVariable("id") int id) {

        Transaction tx = session.beginTransaction();
        Query qupdate = session.createQuery("update Category c set c.cat=:cat where c.id=:id");
        qupdate.setParameter("cat", cat);
        qupdate.setParameter("id", id);
        qupdate.executeUpdate();
        if (tx.getStatus().equals(TransactionStatus.ACTIVE)) {
            tx.commit();
        }
        return "<html><body><script>alert(\"Category Updated\");location.replace(\"/category\")</script></body></html>";
    }

    @PostMapping("/addcategory")
    public String addCategory(@RequestParam("cat") String cat) {

        Transaction tx = session.beginTransaction();
        SQLQuery q = session.createSQLQuery("insert into Category (categories) values('" + cat + "')");
        q.executeUpdate();
        if (tx.getStatus().equals(TransactionStatus.ACTIVE)) {
            tx.commit();
        }
        return "<html><body><script>alert(\"Category Added\");location.replace(\"/category\")</script></body></html>";
    }

    @Transactional
    @GetMapping(value = "/c/{id}")
    public String deleteCategory(@PathVariable("id") int id) {

        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("delete from Category c where c.id=:id");
        q.setParameter("id", id);
        q.executeUpdate();
        if (tx.getStatus().equals(TransactionStatus.ACTIVE)) {
            tx.commit();
        }
        return "<html><body onload=\"\"><script>alert(\"Category Deleted\");location.replace(\"/category\")</script></body></html>";
    }

    @RequestMapping("/categoryproduct")
    public ModelAndView CategoryProduct() {
        Configuration con = new Configuration().configure().addAnnotatedClass(Category.class).addAnnotatedClass(Product.class);
        SessionFactory sf = con.buildSessionFactory();
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        ModelAndView mv = new ModelAndView();
        mv.setViewName("categoryproduct");
        SQLQuery q1 = session.createSQLQuery("SELECT category.Categories , product.name FROM category,product CROSS JOIN category_product WHERE category_product.Category_Id = category.Id AND category_product.product_Id = product.Id;");
        List<Object[]> catprod = (ArrayList<Object[]>) q1.list();
        mv.addObject("catprod", catprod);
        if (tx.getStatus().equals(TransactionStatus.ACTIVE)) {
            tx.commit();
        }
        return mv;
    }
}
