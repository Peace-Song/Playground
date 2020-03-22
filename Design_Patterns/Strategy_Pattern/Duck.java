public abstract class Duck{
  FlyBehavior flyBehavior;
  QuackBehavior quackBehavior;
  
  public Duck(){
    // Constructor
  }

  public void performFly(){
    flyBehavior.fly();
  }

  public void performQuack(){
    quackBehavior.quack();
  }

  public void swim(){
    System.out.println("Every duck can swim, including rubber duck.");
  }
}

class MallardDuck extends Duck{
  public MallardDuck(){
    flyBehavior = new FlyWithWings();
    quackBehavior = new Quack();
  }

  public void display(){
    System.out.println("I am a mallard duck!");
  }
}

class RubberDuck extends Duck{
  public RubberDuck(){
    flyBehavior = new FlyNoWay();
    quackBehavior = new Squeak();
  }

  public void display(){
    System.out.println("I am a rubber duck!");
  }
}