package src.condiment;

import src.coffee.Beverage;

public class SteamMilk extends CondimentDecorator {
    Beverage beverage;

    public SteamMilk(Beverage beverage) {
        this.beverage = beverage;
    }

    public String getDescription() {
        return this.beverage.getDescription() + ", steam milk";
    }

    public double cost() {
        return this.beverage.cost() + 0.10;
    }
}