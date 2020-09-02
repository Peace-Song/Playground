public class Light {
    String placeName;

    public Light(String placeName) {
        this.placeName = placeName;
    }

    public void on() {
        System.out.println(this.placeName + " light on!");
    }

    public void off() {
        System.out.println(this.placeName + " light off!");
    };
}