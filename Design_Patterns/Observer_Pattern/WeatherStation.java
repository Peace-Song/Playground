public class WeatherStation {
    public static void main(String[] args){
        WeatherData weatherData = new WeatherData();
        CurrentConditionDisplay ccd = new CurrentConditionDisplay(weatherData);

        weatherData.setMeasurements(30, 56, 30.4f);
        weatherData.setMeasurements(29, 49, 31.0f);
        weatherData.setMeasurements(31, 55, 29.9f);
    }
}