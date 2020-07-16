import src.coffee.*;
import src.condiment.*;

public class Jabucks {
    public static void main(String[] args){
        Beverage espresso = new Espresso();
        printDescAndCost(espresso);

        Beverage darkroast = new DarkRoast();
        darkroast = new Mocha(darkroast);
        darkroast = new Whip(darkroast);
        printDescAndCost(darkroast);

        Beverage houseblend = new HouseBlend();
        houseblend = new Soy(houseblend);
        houseblend = new Mocha(houseblend);
        houseblend = new SteamMilk(houseblend);
        printDescAndCost(houseblend);
    }

    private static void printDescAndCost(Beverage beverage) {
        System.out.println(beverage.getDescription() + " $" + beverage.cost());
    }
}