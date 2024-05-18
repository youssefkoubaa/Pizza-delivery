package model;

import jakarta.persistence.*;

import model.User;
import model.Pizza;

@Entity
@Table(name = "cart")

public class Cart {

	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	@Column(name = "id")
	private int id;


	@ManyToOne
	@JoinColumn(name = "pizzaid")
	private Pizza pizza;
    @ManyToOne
	@JoinColumn(name = "userid")
	private User user;

	

	@Column(name = "quantity")
	private int quantity;

	
	@Column(name ="price")
	private double price;
	

	public Cart() {
	}

	public Cart( Pizza pizza,User user, int quantity,double price) {
		this.user=user;
		this.pizza = pizza;
		this.quantity = quantity;
		this.price = price;
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public Pizza getPizza() {
		return pizza;
	}

	public void setPizza(Pizza pizza) {
		this.pizza = pizza;
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public double getPrice() {
		return price;
	}
	
	public void setPrice(double price) {
		this.price = price;
	}
	
	
}
