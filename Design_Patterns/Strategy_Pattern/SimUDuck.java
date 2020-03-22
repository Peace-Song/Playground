public class SimUDuck{
  public static void main(String[] args){
    Duck mallard = new MallardDuck();
    mallard.performQuack();
    mallard.performFly();

    Duck rubber = new RubberDuck();
    rubber.performQuack();
    rubber.performFly();
  }
}