package src.condiment;

import src.coffee.Beverage;

public abstract class CondimentDecorator extends Beverage {
    public abstract String getDescription();
}