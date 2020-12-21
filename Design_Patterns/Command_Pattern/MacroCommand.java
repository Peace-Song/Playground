public class MacroCommand implements Command {
    Command[] commands;

    public MacroCommand(Command[] commands) {
        this.commands = commands;
    }

    public void execute() {
        for (int idx = 0; idx < this.commands.length; idx++) {
            this.commands[idx].execute();
        }
    }

    public void undo() {
        for (int idx = this.commands.length - 1; idx >= 0; idx--) {
            this.commands[idx].undo();
        }
    }
}
