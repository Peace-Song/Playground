package src.condiment;

import src.coffee.Beverage;

public class Soy extends CondimentDecorator {
    Beverage beverage;

    public Soy(Beverage beverage) {
        this.beverage = beverage;
    }
    
    public String getDescription() {
        return this.beverage.getDescription() + ", soy";
    }

    public double cost() {
        return this.beverage.cost() + 0.15;
    }
}