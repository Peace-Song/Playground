public abstract class PizzaStore {
    public final Pizza orderPizza(String type) throws InterruptedException {
        Pizza pizza = this.createPizza(type);
        
        pizza.prepare();
        pizza.bake();
        pizza.cut();
        pizza.box();

        return pizza;
    }

    protected abstract Pizza createPizza(String type);
}

class NYPizzaStore extends PizzaStore {
    protected Pizza createPizza(String item) {
        Pizza pizza = null;
        PizzaIngredientFactory factory = new NYPizzaIngredientFactory();

        if (item.equals("cheese")) {
            pizza = new CheesePizza(factory);
        } else if (item.equals("veggie")) {
            pizza = new VeggiePizza(factory);
        } /* else if (item.equals("clam")) {
            return new NYStyleClamPizza();
        } else if (item.equals("pepperoni")) {
            return new NYStylePepperoniPizza();
        } */

        return pizza;
    }

    public static NYPizzaStore makeChainStore() {
        return new NYPizzaStore();
    }
}

class ChicagoPizzaStore extends PizzaStore {
    protected Pizza createPizza(String item) {
        Pizza pizza = null;
        PizzaIngredientFactory factory = new ChicagoPizzaIngredientFactory();
        
        if (item.equals("cheese")) {
            pizza = new CheesePizza(factory);
        } else if (item.equals("veggie")) {
            pizza = new VeggiePizza(factory);
        } /* else if (item.equals("clam")) {
            return new NYStyleClamPizza();
        } else if (item.equals("pepperoni")) {
            return new NYStylePepperoniPizza();
        } */

        return pizza;
    }

    public static ChicagoPizzaStore makeChainStore() {
        return new ChicagoPizzaStore();
    }
}