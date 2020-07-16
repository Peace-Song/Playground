package src.coffee;

import src.coffee.Beverage;

public class Decaf extends Beverage {
    public Decaf() {
        this.description = "Decaffein";
    }

    public double cost() {
        return 1.05;
    }
}