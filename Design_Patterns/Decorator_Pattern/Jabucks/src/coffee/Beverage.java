package src.coffee;

public abstract class Beverage {
    String description = "No description";
    
    public String getDescription() {
        return this.description;
    }

    public abstract double cost();
}