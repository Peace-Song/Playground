public interface PizzaIngredientFactory {
    public String getStyle();
    public Dough createDough();
    public Sauce createSauce();
    public Cheese createCheese();
    public Veggies createVeggies();
    public Pepperoni createPepperoni();
    public Clam createClam();
}

class NYPizzaIngredientFactory implements PizzaIngredientFactory {
    public String getStyle() {
        return "New York Style";
    }

    public Dough createDough() {
        return new ThinCrustDough();
    }

    public Sauce createSauce() {
        return new MarinaraSauce();
    }

    public Cheese createCheese() {
        return new ReggianoCheese();
    }

    public Veggies createVeggies() {
        return new Veggies();
    }

    public Pepperoni createPepperoni() {
        return new Pepperoni();
    }

    public Clam createClam() {
        return new FreshClam();
    }
}

class ChicagoPizzaIngredientFactory implements PizzaIngredientFactory {
    public String getStyle() {
        return "Chicago Style";
    }

    public Dough createDough() {
        return new ThickCrustDough();
    }

    public Sauce createSauce() {
        return new PlumTomatoSauce();
    }

    public Cheese createCheese() {
        return new MozzarellaCheese();
    }

    public Veggies createVeggies() {
        return new Veggies();
    }

    public Pepperoni createPepperoni() {
        return new Pepperoni();
    }

    public Clam createClam() {
        return new FrozenClam();
    }
}