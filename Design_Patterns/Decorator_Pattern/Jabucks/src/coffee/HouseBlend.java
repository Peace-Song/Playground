package src.coffee;

import src.coffee.Beverage;

public class HouseBlend extends Beverage {
    public HouseBlend() {
        this.description = "House blended";
    }

    public double cost() {
        return 0.89;
    }
}