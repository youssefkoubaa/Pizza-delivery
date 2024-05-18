//package model;
//
//
//import java.time.LocalDate;
//
//import main.OrderStatus;
//import java.util.HashSet;
//import java.util.Set;
//
//import jakarta.persistence.*;
//
//import main.OrderStatus;
//
//@Entity
//@Table(name = "orders")
//
//public class Commande {
//	
//	@Id 
//	@GeneratedValue(strategy = GenerationType.TABLE)
//	@Column(name="id")
//	private int id;
//	
//	@Column(name= "amount")
//	private double amount;
//	
//	@Enumerated(EnumType.STRING)
//	@Column(name = "status")
//	private OrderStatus status;
//
//	@Column(name = "address")
//	private String address;
//	
//	@Column(name= "createdDate")
//	private LocalDate dateCreation;
//	
//	@Column(name= "deliveryDate")
//	private LocalDate dateDelivery;
//	
//	@ManyToOne
//	@JoinColumn(name = "client_id")
//	private Client client; 
//	
//
//    @OneToMany(mappedBy = "commande", cascade = CascadeType.ALL)
//    private Set<CommandePizza> commandePizzas = new HashSet<>();
//	
//	
//	
//    
//    public Commande() {
//    	
//    }
//    
//	public Commande(double amount,String address, LocalDate dateCreation, LocalDate dateDelivery, Client client) {
//	
//		this.amount = amount;
//		this.address = address;
//		this.dateCreation = dateCreation;
//		this.dateDelivery = dateDelivery;
//		this.client = client;
//		this.status = OrderStatus.IN_HOLD;
//		
//	}
//
//	
//	public OrderStatus getStatus() {
//		return status;
//	}
//
//	public void setStatus(OrderStatus status) {
//		this.status = status;
//	}
//
//	public Client getClient() {
//		return client;
//	}
//
//	public void setClient(Client client) {
//		this.client = client;
//	}
//
//	public Set<CommandePizza> getCommandePizzas() {
//		return commandePizzas;
//	}
//
//	public void setCommandePizzas(Set<CommandePizza> commandePizzas) {
//		this.commandePizzas = commandePizzas;
//	}
//
//	public int getId() {
//		return id;
//	}
//
//	public void setId(int id) {
//		this.id = id;
//	}
//
//
//
//	public String getAddress() {
//		return address;
//	}
//
//	public void setAddress(String address) {
//		this.address = address;
//	}
//
//	public double getAmount() {
//		return amount;
//	}
//
//	public void setAmount(double amount) {
//		this.amount = amount;
//	}
//
//	public LocalDate getDateCreation() {
//		return dateCreation;
//	}
//
//	public void setDateCreation(LocalDate dateCreation) {
//		this.dateCreation = dateCreation;
//	}
//
//	public LocalDate getDateDelivery() {
//		return dateDelivery;
//	}
//
//	public void setDateDelivery(LocalDate dateDelivery) {
//		this.dateDelivery = dateDelivery;
//	}
//
//
//}