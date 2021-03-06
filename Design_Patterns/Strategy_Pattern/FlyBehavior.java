public interface FlyBehavior{
  public void fly();
}

class FlyWithWings implements FlyBehavior{
  public void fly(){
    System.out.println("Flies!");
  }
}

class FlyNoWay implements FlyBehavior{
  public void fly(){
    System.out.println("Can not fly...");
  }
}

class FlyNuclearPowered implements FlyBehavior{
  public void fly(){
    System.out.println("Flying with nuclear reaction!");
  }
}