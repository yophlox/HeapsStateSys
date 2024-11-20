package substates;

class PauseSubState extends State {
    private var text:h2d.Text;

    public function new() {
        super();
        
        persistentUpdate = false;
        persistentDraw = true;
        
        var overlay = new h2d.Graphics(this);
        overlay.beginFill(0x000000, 0.7);
        overlay.drawRect(0, 0, hxd.Window.getInstance().width, hxd.Window.getInstance().height);
        overlay.endFill();

        text = new h2d.Text(hxd.res.DefaultFont.get(), this);
        text.text = "PAUSED\nPress ESC to resume";
        text.setPosition(
            (hxd.Window.getInstance().width - text.textWidth) * 0.5,
            (hxd.Window.getInstance().height - text.textHeight) * 0.5
        );
    }

    override public function updateState(dt:Float) {
        if (hxd.Key.isPressed(hxd.Key.ESCAPE)) {
            cast(parent, State).closeSubState();
        }
    }
}