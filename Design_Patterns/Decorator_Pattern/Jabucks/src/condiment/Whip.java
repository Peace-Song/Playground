package src.condiment;

import src.coffee.Beverage;

public class Whip extends CondimentDecorator {
    Beverage beverage;

    public Whip(Beverage beverage) {
        this.beverage = beverage;
    }

    public String getDescription() {
        return this.beverage.getDescription() + ", whip";
    }

    public double cost() {
        return this.beverage.cost() + 0.10;
    }
}