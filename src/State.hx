class State extends h2d.Scene {
    public var subState(default, null):State;
    public var persistentUpdate:Bool;
    public var persistentDraw:Bool;
    private var isSubState:Bool;

    public function new() {
        super();
        persistentUpdate = true;
        persistentDraw = true;
        isSubState = false;
    }

    public function update(dt:Float) {
        if (subState != null) {
            subState.update(dt);
            if (subState != null && subState.persistentUpdate == true) {
                updateState(dt);
            }
        } else {
            updateState(dt);
        }
    }

    public function updateState(dt:Float) {}

    override public function draw(ctx:h2d.RenderContext):Void {
        if (subState == null || persistentDraw) {
            super.draw(ctx);
        }
        
        if (subState != null && subState.persistentDraw) {
            subState.visible = true;
            subState.draw(ctx);
        }
    }

    public function openSubState(subState:State) {
        if (this.subState != null) {
            this.subState.closeSubState();
        }
            
        this.subState = subState;
        subState.isSubState = true;
        addChild(subState);
        subState.onEnter();
    }

    public function closeSubState() {
        if (subState != null) {
            subState.onExit();
            removeChild(subState);
            subState.isSubState = false;
            subState = null;
        }
    }

    public function toggleSubState(SubStateClass:Class<State>) {
        if (subState == null) {
            var newSubState = Type.createInstance(SubStateClass, []);
            openSubState(newSubState);
        } else {
            closeSubState();
        }
    }

    public function onEnter() {}
    public function onExit() {}
}