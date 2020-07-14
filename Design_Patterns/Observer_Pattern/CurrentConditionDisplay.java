public class CurrentConditionDisplay implements Observer, DisplayElement {
    private float temperature;
    private float humidity;
    private float pressure;
    private Subject weatherData;

    public CurrentConditionDisplay(Subject weatherData) {
        this.weatherData = weatherData;
        this.weatherData.registerObserver(this);
    }

    public void update(float temperature, float humidity, float pressure) {
        this.temperature = temperature;
        this.humidity = humidity;
        this.pressure = pressure;
        this.display();
    }

    public void display() {
        System.out.println("===================================");
        System.out.println("Current conditions");
        System.out.println("Temperature: " + this.temperature + "F");
        System.out.println("Humidity: " + this.humidity + "%");
        System.out.println("Pressure: " + this.pressure + "pa");
        System.out.println("===================================");
    }
}