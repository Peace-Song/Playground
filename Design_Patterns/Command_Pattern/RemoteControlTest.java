public class RemoteControlTest {
    public static void main(String[] args) {
        RemoteControl remoteControl = new RemoteControl();

        Light livingRoomLight = new Light("Living room");
        LightOnCommand livingRoomLightOn = new LightOnCommand(livingRoomLight);
        LightOffCommand livingRoomLightOff = new LightOffCommand(livingRoomLight);

        Light kitchenLight = new Light("Kitchen");
        LightOnCommand kitchenLightOn = new LightOnCommand(kitchenLight);
        LightOffCommand kitchenLightOff = new LightOffCommand(kitchenLight);

        GarageDoor garageDoor = new GarageDoor();
        GarageDoorOpenCommand garageDoorOpen = new GarageDoorOpenCommand(garageDoor);
        GarageDoorCloseCommand garageDoorClose = new GarageDoorCloseCommand(garageDoor);

        CeilingFan ceilingFan = new CeilingFan("Living room");
        CeilingFanHighCommand ceilingFanOn = new CeilingFanHighCommand(ceilingFan);
        CeilingFanOffCommand ceilingFanOff = new CeilingFanOffCommand(ceilingFan);

        Stereo stereo = new Stereo("Living room");
        StereoOnWithCDCommand stereoOnWithCD = new StereoOnWithCDCommand(stereo);
        StereoOffCommand stereoOff = new StereoOffCommand(stereo);

        remoteControl.setCommand(0, livingRoomLightOn, livingRoomLightOff);
        remoteControl.setCommand(1, kitchenLightOn, kitchenLightOff);
        remoteControl.setCommand(2, ceilingFanOn, ceilingFanOff);
        remoteControl.setCommand(3, stereoOnWithCD, stereoOff);

        System.out.println(remoteControl);

        remoteControl.onPressOnButton(0);
        remoteControl.onPressOffButton(0);
        remoteControl.onPressOnButton(1);
        remoteControl.onPressOffButton(1);
        remoteControl.onPressOnButton(2);
        remoteControl.onPressOffButton(2);
        remoteControl.onPressOnButton(3);
        remoteControl.onPressOffButton(3);
        remoteControl.onPressOnButton(4);
        remoteControl.onPressOffButton(4);

        remoteControl.onPressUndoButton();

        Command[] livingRoomOn = {livingRoomLightOn, ceilingFanOn, stereoOnWithCD};
        Command[] livingRoomOff = {livingRoomLightOff, ceilingFanOff, stereoOff};

        MacroCommand onMacro = new MacroCommand(livingRoomOn);
        MacroCommand offMacro = new MacroCommand(livingRoomOff);

        remoteControl.setCommand(0, onMacro, offMacro);
        System.out.println("----------------MACRO ON----------------");
        remoteControl.onPressOnButton(0);
        System.out.println("----------------MACRO OFF---------------");
        remoteControl.onPressOffButton(0);
    }
}