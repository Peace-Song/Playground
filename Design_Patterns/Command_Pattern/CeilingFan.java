public class CeilingFan {
    String placeName;

    public CeilingFan(String placeName) {
        this.placeName = placeName;
    }

    public void on() {
        System.out.println(this.placeName + " ceiling fan on!");
    }

    public void off() {
        System.out.println(this.placeName + " ceiling fan off!");
    }
}