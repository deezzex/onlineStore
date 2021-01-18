/**
 * @author deezzex <3
 */


package org.example.entities;

import org.example.entities.enums.Category;
import org.example.entities.enums.Stock;
import org.example.entities.util.ProductHelper;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Product {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;
    private String name;
    private String consist;
    private String descriptions;
    private String producer;
    private Long price;
    private String fileName;
    private String subtitle;
    private String weight;
    private String evaluationForm;

    @ElementCollection(targetClass = Stock.class,fetch = FetchType.EAGER)
    @CollectionTable(name = "product_inStock",joinColumns = @JoinColumn(name = "product_id"))
    @Enumerated(EnumType.STRING)
    private Set<Stock> inStock;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="user_id")
    private User author;

    @ElementCollection(targetClass = Category.class,fetch = FetchType.EAGER)
    @CollectionTable(name = "product_category",joinColumns = @JoinColumn(name = "product_id"))
    @Enumerated(EnumType.STRING)
    private Set<Category> categories;

    @ManyToMany
    @JoinTable(name = "message_likes",
                joinColumns = {@JoinColumn(name = "product_id")},
                inverseJoinColumns = {@JoinColumn(name = "user_id")})
    private Set<User> likes = new HashSet<>();

    public Product() {
    }

    public Product(String name, String consist, String descriptions, String producer, Long price,String subtitle,String weight,String evaluationForm, User user) {
        this.name = name;
        this.consist = consist;
        this.descriptions = descriptions;
        this.producer = producer;
        this.price = price;
        this.subtitle = subtitle;
        this.weight = weight;
        this.evaluationForm = evaluationForm;
        this.author = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getConsist() {
        return consist;
    }

    public void setConsist(String consist) {
        this.consist = consist;
    }

    public String getDescriptions() {
        return descriptions;
    }

    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getEvaluationForm() {
        return evaluationForm;
    }

    public void setEvaluationForm(String evaluationForm) {
        this.evaluationForm = evaluationForm;
    }

    public Set<Category> getCategories() {
        return categories;
    }

    public void setCategories(Set<Category> categories) {
        this.categories = categories;
    }

    public String getAuthorName(){
        return ProductHelper.getAuthorName(author);
    }

    public Set<Stock> getInStock() {
        return inStock;
    }

    public void setInStock(Set<Stock> inStock) {
        this.inStock = inStock;
    }

    public Set<User> getLikes() {
        return likes;
    }

    public void setLikes(Set<User> likes) {
        this.likes = likes;
    }

    @Override
    public String toString() {
        return subtitle + " " + producer;
    }
}
