public class Stereo {
    String placeName;
    int volume;

    public Stereo(String placeName) {
        this.placeName = placeName;
        this.volume = 0;
    }

    public void on() {
        System.out.println(this.placeName + " stereo on!");
    }

    public void off() {
        System.out.println(this.placeName + " stereo off!");
    }

    public void setCD() {
        System.out.println(this.placeName + " stereo has set CD!");
    }

    public void setVolume(int volume) {
        this.volume = volume;
        System.out.println(this.placeName + " stereo volume set to " + this.volume + "!");
    }
}