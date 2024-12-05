package dinorun_pkg;

    // Screen dimensions (640x480 VGA resolution)
    localparam int ScreenWidth  = 640;
    localparam int ScreenHeight = 480;

    // Ground position (Y-coordinate where the ground starts)
    localparam int Ground = 400;

    // Initial X-coordinate for obstacles and moving elements
    localparam int ObstacleInitialX = 640;

    // Game states
    typedef enum logic [1:0] {
        TITLE_SCREEN,      // 0: Title screen
        GAME_RUNNING,      // 1: Game is running
        GAME_OVER          // 2: Game over
    } state_t;

endpackage
