class StateManager {
    static public var instance(get, null):StateManager;
    static private function get_instance():StateManager {
        if (instance == null) instance = new StateManager();
        return instance;
    }

    public var currentState:State;
    private var app:Main;

    private function new() {}

    public function initialize(app:Main) {
        this.app = app;
    }

    public function switchState(nextState:State) {
        if (currentState != null) {
            currentState.onExit();
            app.s2d.removeChild(currentState);
        }

        currentState = nextState;
        app.s2d.addChild(currentState);
        currentState.onEnter();
    }

    public function update(dt:Float) {
        if (currentState != null) {
            currentState.update(dt);
            currentState.draw(app.s2d.renderer);
        }
    }
}