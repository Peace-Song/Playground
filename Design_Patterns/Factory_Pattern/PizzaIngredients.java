class Dough {
    protected String name;

    public Dough() {
        this.name = "Normal Dough";
    }

    public String getName() {
        return this.name;
    }
}

class ThickCrustDough extends Dough {
    public ThickCrustDough() {
        this.name = "Thick Crust Dough";
    }
}

class ThinCrustDough extends Dough {
    public ThinCrustDough() {
        this.name = "Thin Crust Dough";
    }
}


class Sauce {
    protected String name;

    public Sauce() {
        this.name = "Normal Sauce";
    }

    public String getName() {
        return this.name;
    }
}

class PlumTomatoSauce extends Sauce {
    public PlumTomatoSauce() {
        this.name = "Plum Tomato Sauce";
    }
}

class MarinaraSauce extends Sauce {
    public MarinaraSauce() {
        this.name = "Marinara Sauce";
    }
}


class Cheese {
    protected String name;

    public Cheese() {
        this.name = "Normal Cheese";
    }

    public String getName() {
        return this.name;
    }
}

class MozzarellaCheese extends Cheese {
    public MozzarellaCheese() {
        this.name = "Mozzarella Cheese";
    }
}

class ReggianoCheese extends Cheese {
    public ReggianoCheese() {
        this.name = "Reggiano Cheese";
    }
}


class Veggies {
    protected String name;

    public Veggies() {
        this.name = "Normal Veggies";
    }

    public String getName() {
        return this.name;
    }
}

class Pepperoni {
    protected String name;

    public Pepperoni() {
        this.name = "Normal Pepperoni";
    }

    public String getName() {
        return this.name;
    }
}

class Clam {
    protected String name;

    public Clam() {
        this.name = "Normal Clam";
    }

    public String getName() {
        return this.name;
    }
}

class FrozenClam extends Clam {
    public FrozenClam() {
        this.name = "Frozen Clam";
    }
}

class FreshClam extends Clam {
    public FreshClam() {
        this.name = "Fresh Clam";
    }
}