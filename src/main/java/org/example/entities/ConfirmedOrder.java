/**
 * @author deezzex <3
 */


package org.example.entities;

import org.example.entities.enums.Status;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Set;

@Entity
public class ConfirmedOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @NotBlank(message = "Вкажіть місто доставки!")
    private String cityDestination;
    @NotBlank(message = "Вкажіть вулицю доставки!")
    private String streetDestination;
    @NotBlank(message = "Вкажіть номер телефону одержувача")
    private String phone;
    @NotBlank(message = "Вкажіть імя одержувача")
    private String firstNameOfCustomer;
    @NotBlank(message = "Вкажіть прізвище одержувача")
    private String lastNameOfCustomer;
    private Long total;

    @ElementCollection(targetClass = Status.class,fetch = FetchType.EAGER)
    @CollectionTable(name = "order_status",joinColumns = @JoinColumn(name = "order_id"))
    @Enumerated(EnumType.STRING)
    private Set<Status> statuses;

    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name="confirmOrderId")
    private Set<Order> orders;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="user_id")
    private User author;

    public ConfirmedOrder() {
    }

    public ConfirmedOrder(String cityDestination, String streetDestination,String phone, String firstNameOfCustomer, String lastNameOfCustomer ,Set<Order> orders,Long total) {
        this.cityDestination = cityDestination;
        this.streetDestination = streetDestination;
        this.phone = phone;
        this.firstNameOfCustomer = firstNameOfCustomer;
        this.lastNameOfCustomer = lastNameOfCustomer;
        this.orders = orders;
        this.total=total;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCityDestination() {
        return cityDestination;
    }

    public void setCityDestination(String cityDestination) {
        this.cityDestination = cityDestination;
    }

    public String getStreetDestination() {
        return streetDestination;
    }

    public void setStreetDestination(String streetDestination) {
        this.streetDestination = streetDestination;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFirstNameOfCustomer() {
        return firstNameOfCustomer;
    }

    public void setFirstNameOfCustomer(String firstNameOfCustomer) {
        this.firstNameOfCustomer = firstNameOfCustomer;
    }

    public String getLastNameOfCustomer() {
        return lastNameOfCustomer;
    }

    public void setLastNameOfCustomer(String lastNameOfCustomer) {
        this.lastNameOfCustomer = lastNameOfCustomer;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public Set<Order> getOrders() {
        return orders;
    }

    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }

    public Set<Status> getStatuses() {
        return statuses;
    }

    public void setStatuses(Set<Status> statuses) {
        this.statuses = statuses;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }
}
