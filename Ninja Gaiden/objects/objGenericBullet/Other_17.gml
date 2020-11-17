/// @description Getting killed
particle_create(x, (y - (sprite_height div 2)), sprBulletExplosion, (1 / 2), false, (depth - 5));
play_sfx(sfxMinorExplosion);
instance_destroy();