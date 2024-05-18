package util;

import dao.PizzaDao;
import model.Pizza;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        PizzaDao pizzaDao = new PizzaDao();

        // Creating new pizza objects
        Pizza pizza1 = new Pizza("Cheese pizza", "A timeless classic featuring a blend of melted mozzarella, cheddar, and parmesan cheeses on a soft crust, topped with tangy tomato sauce. Simple, satisfying, and irresistibly cheesy.",25.00 , "pizza-4.png");
        Pizza pizza3 = new Pizza("Seafood pizza", "Indulge in our Seafood Pizza, loaded with shrimp, squid, and mussels atop a bed of tangy marinara sauce and melted mozzarella cheese. A taste of the ocean in every bite!",65.00 , "pizza-2.png");
        Pizza pizza2 = new Pizza("Shrimp pizza", "Savor the taste of the sea with our Shrimp Pizza. Succulent shrimp, creamy Alfredo sauce, caramelized onions, and a hint of red pepper flakes atop a golden crust. A flavorful seafood delight in every bite.",35.00 , "pizza-1.png");

        // Persisting pizza objects
        pizzaDao.create(pizza1);
        pizzaDao.create(pizza2);
        pizzaDao.create(pizza3);

        // Retrieving a pizza by id
        Pizza retrievedPizza = pizzaDao.getPizza(pizza1.getId());
        if (retrievedPizza != null) {
            System.out.println("Retrieved Pizza: " + retrievedPizza.getName() + " - " + retrievedPizza.getDescription());
        } else {
            System.out.println("Pizza not found");
        }

        // Retrieving all pizzas
        List<Pizza> pizzas = pizzaDao.getAllPizzas();
        System.out.println("All Pizzas:");
        for (Pizza pizza : pizzas) {
            System.out.println(pizza.getName() + " - " + pizza.getDescription());
        }
    }
}
