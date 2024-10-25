event_inherited();
sprite_index = sSlime_EnemyIdle;

hp = 50;
attack = 20;
move_direction = irandom(359);
home_radius = 100;
move_speed = 0.5;
hurtTimer = 10;


states.idle = new State (sSlime_EnemyIdle);
states.returnHome = new State (sSlime_EnemyIdle);
states.pursue = new State (sSlime_EnemyIdle);
states.hurt = new State (sSlime_EnemyHurt);
states.death = new State (sSlime_EnemyDeath);
states.attack = new State (sSlime_EnemyAttack);

state = states.idle;
states.attack.StateOnEnd(states.idle);
states.hurt.StateOnEnd(states.idle);
states.returnHome.StateOnEnd(states.idle);
states.pursue.StateOnEnd(states.idle);