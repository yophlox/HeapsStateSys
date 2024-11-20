package states;

class MenuState extends State {
    private var text:h2d.Text;

    public function new() {
        super();
        text = new h2d.Text(hxd.res.DefaultFont.get(), this);
        text.text = "Menu State - Press SPACE to play";
    }

    override public function update(dt:Float) {
        if (hxd.Key.isPressed(hxd.Key.SPACE)) {
            StateManager.instance.switchState(new PlayState());
        }
    }

    override public function onEnter() {
        trace("Entering Menu State");
    }

    override public function onExit() {
        trace("Exiting Menu State");
    }
}