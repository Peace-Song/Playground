import java.util.ArrayList;

public class Pizza {
    protected String name;
    protected String dough;
    protected String sauce;
    protected ArrayList<String> toppings = new ArrayList<String>();
    
    public void prepare() throws InterruptedException {
        System.out.println("Preparing " + this.name + "...");
        Thread.sleep(1000);
        
        System.out.println("Tossing " + this.dough + "...");
        Thread.sleep(1000);

        System.out.println("Adding " + this.sauce + "...");
        Thread.sleep(1000);

        for (String aTopping : this.toppings)
            System.out.print(aTopping + " ");
        System.out.println("");
        Thread.sleep(1000);
    }

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

    public String getName() {
        return this.name;
    }
}

class NYStyleCheesePizza extends Pizza {
    public NYStyleCheesePizza() {
        this.name = "NY Style Sauce and Cheese Pizza";
        this.dough = "Thin Crust Dough";
        this.sauce = "Marinara Sauce";
        this.toppings.add("Grated Reggiano Cheese");
    }
}

class ChicagoStyleCheesePizza extends Pizza {
    public ChicagoStyleCheesePizza() {
        this.name = "Chicago Style Deep Dish Cheese Pizza";
        this.dough = "Extra Thick Crust Dough";
        this.sauce = "Plum Tomato Sauce";
        this.toppings.add("Shredded Mozzarella Cheese");
    }

    public void cut() throws InterruptedException {
        System.out.println("Cutting the pizza into square slices");
        Thread.sleep(1000);
    }
}