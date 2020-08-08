public class ChocolateBoiler {
    private boolean empty;
    private boolean boiled;

    private static ChocolateBoiler instance;

    private ChocolateBoiler() {
        this.empty = true;
        this.boiled = false;
    }

    public void fill() {
        if (this.empty) {
            this.empty = false;
            this.boiled = false;
        }
    }

    public void drain() {
        if (!this.empty && this.boiled) {
            this.empty = true;
        }
    }

    public void boil() {
        if (!this.empty && !this.boiled) {
            this.boiled = true;
        }
    }

    public boolean isEmpty() {
        return this.empty;
    }

    public boolean isBoiled() {
        return this.boiled;
    }

    /*
     * Thread-unsafe singleton
     */
    public ChocolateBoiler getInstance() {
        if (ChocolateBoiler.instance == null) {
            ChocolateBoiler.instance = new ChocolateBoiler();
        }

        return ChocolateBoiler.instance;
    }
}