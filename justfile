# Justfile for Dragonfly Red game with hot reload
# Default task
@start:
    just --watch run
# Run the game with Godot
@run:
    godot
# Watch for file changes and restart the game
@watch:
    just --watch run
