public interface Command {
    public void execute();
    public void undo();
}

class LightOnCommand implements Command {
    Light light;

    public LightOnCommand(Light light) {
        this.light = light;
    }

    public void execute() {
        this.light.on();
    }

    public void undo() {
        this.light.off();
    }
}

class LightOffCommand implements Command {
    Light light;

    public LightOffCommand(Light light) {
        this.light = light;
    }

    public void execute() {
        this.light.off();
    }

    public void undo() {
        this.light.on();
    }
}

class GarageDoorOpenCommand implements Command {
    GarageDoor door;

    public GarageDoorOpenCommand(GarageDoor door) {
        this.door = door;
    }

    public void execute() {
        this.door.up();
    }

    public void undo() {
        this.door.down();
    }
}

class GarageDoorCloseCommand implements Command {
    GarageDoor door;

    public GarageDoorCloseCommand(GarageDoor door) {
        this.door = door;
    }

    public void execute() {
        this.door.down();
    }

    public void undo() {
        this.door.up();
    }
}

class StereoOnWithCDCommand implements Command {
    Stereo stereo;

    public StereoOnWithCDCommand(Stereo stereo) {
        this.stereo = stereo;
    }

    public void execute() {
        this.stereo.on();
        this.stereo.setCD();
        this.stereo.setVolume(10);
    }

    public void undo() {
        this.stereo.off();
    }
}

class StereoOffCommand implements Command {
    Stereo stereo;

    public StereoOffCommand(Stereo stereo) {
        this.stereo = stereo;
    }

    public void execute() {
        this.stereo.off();
    }

    public void undo() {
        this.stereo.on();
        this.stereo.setCD();
        this.stereo.setVolume(10);
    }
}

class CeilingFanHighCommand implements Command {
    CeilingFan fan;
    int prevSpeed;

    public CeilingFanHighCommand(CeilingFan fan) {
        this.fan = fan;
    }

    public void execute() {
        this.prevSpeed = this.fan.getSpeed();
        this.fan.high();
    }

    public void undo() {
        switch (this.prevSpeed) {
            case CeilingFan.HIGH:
                this.fan.high();
                break;
            case CeilingFan.MEDIUM:
                this.fan.medium();
                break;
            case CeilingFan.LOW:
                this.fan.low();
                break;
            case CeilingFan.OFF:
                this.fan.off();
                break;
            default:
                break;
        }
    }
}

class CeilingFanMediumCommand implements Command {
    CeilingFan fan;
    int prevSpeed;

    public CeilingFanMediumCommand(CeilingFan fan) {
        this.fan = fan;
    }

    public void execute() {
        this.prevSpeed = this.fan.getSpeed();
        this.fan.medium();
    }

    public void undo() {
        switch (this.prevSpeed) {
            case CeilingFan.HIGH:
                this.fan.high();
                break;
            case CeilingFan.MEDIUM:
                this.fan.medium();
                break;
            case CeilingFan.LOW:
                this.fan.low();
                break;
            case CeilingFan.OFF:
                this.fan.off();
                break;
            default:
                break;
        }
    }
}

class CeilingFanLowCommand implements Command {
    CeilingFan fan;
    int prevSpeed;

    public CeilingFanLowCommand(CeilingFan fan) {
        this.fan = fan;
    }

    public void execute() {
        this.prevSpeed = this.fan.getSpeed();
        this.fan.low();
    }

    public void undo() {
        switch (this.prevSpeed) {
            case CeilingFan.HIGH:
                this.fan.high();
                break;
            case CeilingFan.MEDIUM:
                this.fan.medium();
                break;
            case CeilingFan.LOW:
                this.fan.low();
                break;
            case CeilingFan.OFF:
                this.fan.off();
                break;
            default:
                break;
        }
    }
}

class CeilingFanOffCommand implements Command {
    CeilingFan fan;
    int prevSpeed;

    public CeilingFanOffCommand(CeilingFan fan) {
        this.fan = fan;
    }

    public void execute() {
        this.prevSpeed = this.fan.getSpeed();
        this.fan.off();
    }

    public void undo() {
        switch (this.prevSpeed) {
            case CeilingFan.HIGH:
                this.fan.high();
                break;
            case CeilingFan.MEDIUM:
                this.fan.medium();
                break;
            case CeilingFan.LOW:
                this.fan.low();
                break;
            case CeilingFan.OFF:
                this.fan.off();
                break;
            default:
                break;
        }
    }
}

// "null object" to not take care of null
class NoCommand implements Command {
    public void execute() { }
    public void undo() { }
}