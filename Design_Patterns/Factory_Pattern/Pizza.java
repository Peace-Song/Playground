public abstract class Pizza {
    protected String name;
    protected Dough dough;
    protected Sauce sauce;
    protected Veggies veggies;
    protected Cheese cheese;
    protected Pepperoni pepperoni;
    protected Clam clam;

    public abstract void prepare() throws InterruptedException;

    public void bake() throws InterruptedException {
        System.out.println("Bake for 25 minutes at 350");
        Thread.sleep(1000);
    }

    public void cut() throws InterruptedException {
        System.out.println("Cutting the pizza into diagonal slices");
        Thread.sleep(1000);
    }

    public void box() throws InterruptedException {
        System.out.println("Place pizza in official PizzaStore box");
        Thread.sleep(1000);

    }
}

class CheesePizza extends Pizza {
    private PizzaIngredientFactory factory;

    public CheesePizza(PizzaIngredientFactory factory) {
        this.name = "Cheese Pizza";
        this.factory = factory;
    }

    public void prepare() {
        this.dough = this.factory.createDough();
        this.sauce = this.factory.createSauce();
        this.veggies = this.factory.createVeggies();
        this.cheese = this.factory.createCheese();
        this.clam = this.factory.createClam();
    }

    public String toString() {
        return this.factory.getStyle() + " " + 
            this.name + " with " + 
            this.dough.getName() + ", " +
            this.sauce.getName() + ", " +
            this.veggies.getName() + ", " +
            this.cheese.getName() + ", and " +
            this.clam.getName();
    }
}

class VeggiePizza extends Pizza {
    private PizzaIngredientFactory factory;

    public VeggiePizza(PizzaIngredientFactory factory) {
        this.name = "Veggie Pizza";
        this.factory = factory;
    }

    public void prepare() {
        this.dough = this.factory.createDough();
        this.sauce = this.factory.createSauce();
        this.cheese = this.factory.createCheese();
        this.pepperoni = this.factory.createPepperoni();
        this.clam = this.factory.createClam();
    }

    public void cut() throws InterruptedException {
        System.out.println("Cutting the pizza into square slices");
        Thread.sleep(1000);
    }

    public String toString() {
        return this.factory.getStyle() + " " + 
            this.name + " with " + 
            this.dough.getName() + ", " +
            this.sauce.getName() + ", " +
            this.cheese.getName() + ", " +
            this.pepperoni.getName() + ", and " +
            this.clam.getName();
    }
}