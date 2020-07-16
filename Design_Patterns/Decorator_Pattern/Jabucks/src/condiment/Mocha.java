package src.condiment;

import src.coffee.Beverage;

public class Mocha extends CondimentDecorator {
    Beverage beverage;

    public Mocha(Beverage beverage) {
        this.beverage = beverage;
    }

    public String getDescription() {
        return this.beverage.getDescription() + ", mocha";
    }

    public double cost() {
        return this.beverage.cost() + 0.20;
    }
}