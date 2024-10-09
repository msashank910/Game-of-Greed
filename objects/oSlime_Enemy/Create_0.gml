event_inherited();

hp = 50;
attack = 20;

idle = new State (sSlime_EnemyIdle);
walk = new State (sSlime_EnemyIdle);
hurt = new State (sSlime_EnemyHurt);
death = new State (sSlime_EnemyDeath);
attack = new State (sSlime_EnemyAttack);