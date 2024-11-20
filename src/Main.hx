class Main extends hxd.App {
    override function init() {
        StateManager.instance.initialize(this);
        StateManager.instance.switchState(new states.PlayState());
    }

    override function update(dt:Float) {
        StateManager.instance.update(dt);
    }

    static function main() {
        new Main();
    }
}