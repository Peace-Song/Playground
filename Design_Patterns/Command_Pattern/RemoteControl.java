public class RemoteControl {
    Command[] onCommands;
    Command[] offCommands;

    public RemoteControl() {
        onCommands = new Command[7];
        offCommands = new Command[7];

        Command noCommand = new NoCommand();

        for (int idx = 0; idx < onCommands.length; idx++) {
            onCommands[idx] = noCommand;
            offCommands[idx] = noCommand;
        }
    }

    public void setCommand(int slot, Command onCommand, Command offCommand) {
        onCommands[slot] = onCommand;
        offCommands[slot] = offCommand;
    }

    public void onPressOnButton(int slot) {
        onCommands[slot].execute();
    }

    public void onPressOffButton(int slot) {
        offCommands[slot].execute();
    }

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();

        stringBuffer.append("\n-------- Remote Control --------\n");
        for (int idx = 0; idx < onCommands.length; idx++) {
            stringBuffer.append(
                "[slot " + idx + "] " + 
                onCommands[idx].getClass().getName() + "    " +
                offCommands[idx].getClass().getName() + "\n"
            );
        }

        return stringBuffer.toString();
    }
}