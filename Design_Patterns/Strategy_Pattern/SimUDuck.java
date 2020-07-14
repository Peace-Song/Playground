public class SimUDuck{
  public static void main(String[] args){
    Duck mallard = new MallardDuck();
    mallard.display();
    mallard.performQuack();
    mallard.performFly();

    Duck rubber = new RubberDuck();
    rubber.display();
    rubber.performQuack();
    rubber.performFly();

    // Can dynamically assign action!
    Duck model = new ModelDuck();
    model.display();
    model.performQuack();
    model.performFly();
    model.setFlyBehavior(new FlyNuclearPowered());
    model.performFly();
  }
}