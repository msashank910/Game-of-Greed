/*
function MoveEnemy(dx, dy){
	// Handle horizontal movement (dx)
    if (dx != 0) {
        var _dir = (dx > 0) ? 0 : 180; // Right (0°) or Left (180°)
        var move_amount = floor(abs(dx)) + 0.000001;
        move_contact_solid(_dir, move_amount);
        
        // Fractional movement
        if (random(1) < frac(abs(dx))) {
            move_contact_solid(_dir, 1);
        }
    }

    // Handle vertical movement (dy)
    if (dy != 0) {
        var _dir = (dy > 0) ? 270 : 90; // Down (270°) or Up (90°)
        var move_amount = floor(abs(dy)) + 0.000001;
        move_contact_solid(_dir, move_amount);
        
        // Fractional movement
        if (random(1) < frac(abs(dy))) {
            move_contact_solid(_dir, 1);
        }
    }

}
*/

function MoveEnemy(dx, dy) {
    // Handle horizontal movement (dx)
    if (dx != 0) {
        var _new_x = x + dx;
        if (!position_meeting(_new_x, y, wallTileMap)) {
            x = _new_x;
        }
    }

    // Handle vertical movement (dy)
    if (dy != 0) {
        var _new_y = y + dy;
        if (!position_meeting(x, _new_y, wallTileMap)) {
            y = _new_y;
        }
    }
}
