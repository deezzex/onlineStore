/**
 * @author deezzex <3
 */


package org.example.entities.dto;

import org.example.entities.Product;
import org.example.entities.User;
import org.example.entities.util.ProductHelper;

public class ProductDto {
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
    private User author;
    private Long likes;
    private boolean meLiked;

    public ProductDto(Product product, Long likes, boolean meLiked) {
        this.id = product.getId();
        this.name = product.getName();
        this.consist = product.getConsist();
        this.descriptions = product.getDescriptions();
        this.producer = product.getProducer();
        this.price = product.getPrice();
        this.fileName = product.getFileName();
        this.subtitle = product.getSubtitle();
        this.weight = product.getWeight();
        this.evaluationForm = product.getEvaluationForm();
        this.author = product.getAuthor();
        this.likes = likes;
        this.meLiked = meLiked;
    }

    public String getAuthorName(){
        return ProductHelper.getAuthorName(author);
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getConsist() {
        return consist;
    }

    public String getDescriptions() {
        return descriptions;
    }

    public String getProducer() {
        return producer;
    }

    public Long getPrice() {
        return price;
    }

    public String getFileName() {
        return fileName;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public String getWeight() {
        return weight;
    }

    public String getEvaluationForm() {
        return evaluationForm;
    }

    public User getAuthor() {
        return author;
    }

    public Long getLikes() {
        return likes;
    }

    public boolean isMeLiked() {
        return meLiked;
    }

    @Override
    public String toString() {
        return "ProductDto{" +
                "id=" + id +
                ", subtitle='" + subtitle + '\'' +
                ", author=" + author +
                ", likes=" + likes +
                ", meLiked=" + meLiked +
                '}';
    }
}
