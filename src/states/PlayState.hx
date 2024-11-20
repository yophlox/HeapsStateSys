package states;

class PlayState extends State {
    private var text:h2d.Text;
    private var player:h2d.Graphics;

    public function new() {
        super();
        
        text = new h2d.Text(hxd.res.DefaultFont.get(), this);
        text.text = "PlayState - Press SPACE for menu\nPress ESC to pause";
        
        player = new h2d.Graphics(this);
        player.beginFill(0x00FF00);
        player.drawRect(0, 0, 32, 32);
        player.endFill();
        player.setPosition(100, 100);
    }

    override public function updateState(dt:Float) {
        if (hxd.Key.isDown(hxd.Key.LEFT)) player.x -= 200 * dt;
        if (hxd.Key.isDown(hxd.Key.RIGHT)) player.x += 200 * dt;
        if (hxd.Key.isDown(hxd.Key.UP)) player.y -= 200 * dt;
        if (hxd.Key.isDown(hxd.Key.DOWN)) player.y += 200 * dt;

        if (hxd.Key.isPressed(hxd.Key.ESCAPE)) {
            toggleSubState(substates.PauseSubState);
        }

        if (hxd.Key.isPressed(hxd.Key.SPACE)) {
            StateManager.instance.switchState(new MenuState());
        }
    }
}