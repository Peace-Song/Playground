package src.coffee;

import src.coffee.Beverage;

public class Espresso extends Beverage {
    public Espresso() {
        this.description = "Espresso";
    }

    public double cost() {
        return 1.99;
    }
}