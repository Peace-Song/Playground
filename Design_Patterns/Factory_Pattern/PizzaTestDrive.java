public class PizzaTestDrive {
    public static void main(String[] args) throws InterruptedException {
        PizzaStore nyStore = NYPizzaStore.makeChainStore();
        PizzaStore chicagoStore = ChicagoPizzaStore.makeChainStore();

        Pizza nyStyleCheesePizza = nyStore.orderPizza("cheese");
        System.out.println("Arthur Morgan ordered a " + nyStyleCheesePizza.getName() + "\n");

        Pizza chicagoStyleCheesePizza = chicagoStore.orderPizza("cheese");
        System.out.println("Ellie ordered a " + chicagoStyleCheesePizza.getName() + "\n");
    }
}