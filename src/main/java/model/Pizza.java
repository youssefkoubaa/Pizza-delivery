package model;

import jakarta.persistence.*;

@Entity
@Table(name = "pizza")
public class Pizza {
    @Id 
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;
    
    @Column(name = "description") 
    private String description;
    
    @Column(name = "image") 
    private String image;
    
    @Column(name = "prix") 
    private double prix;

    // Default constructor required by JPA
    public Pizza() {}

    // Constructor with parameters (excluding id)
    public Pizza(String name, String description, double prix, String image) {
        this.name = name;
        this.description = description;
        this.image = image;
        this.prix = prix;
    }

    // Getter and Setter for id
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // Getter and Setter for name
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // Getter and Setter for description
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    // Getter and Setter for image
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    // Getter and Setter for prix
    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }
}
