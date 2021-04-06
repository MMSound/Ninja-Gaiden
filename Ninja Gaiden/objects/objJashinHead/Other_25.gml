/// @description Controlling
switch (phase)
{
	case 0: //neutral
		if (iFrameTimer > 0)
		{
			iFrameTimer--;
		}
		canBeHit = (iFrameTimer == 0);
		visible = (iFrameTimer % 2 == 0);
		
		if (healthPoints <= 8)
		{
			phase = 1;
			phaseTimer = 0;
			canBeHit = false;
			iFrameTimer = 0;
			visible = true;
			healthPoints = 16;
			init_new_phase(272, 176, 160, 192, 1.00);
			if (instance_exists(objJashinHeart))
			{
				with (objJashinHeart)
				{
					canHit = false;
				}
			}
			music_stop();
			imgSpd = (1 / 4);
			amplitude = 1;
		}
		break;
	case 1: //barbarian
		visible = (phaseTimer % 2 == 0);
		
		xspeed = -1;
		
		wave_update();
		
		if (phaseTimer >= phaseTime) //goto bomberhead
		{
			phase++;
			phaseTimer = 0;
			init_new_phase(64, 176, 336, 192, -1.00, -1.00);
			hasGravity = true;
			hasCollision = true;
		}
		break;
	case 2: //bomberhead
		visible = (phaseTimer % 2 == 0);
		
		if (mySickle == noone)
		{
			mySickle = instance_create_depth(x, y, depth, objBomberheadSickle);
			mySickle.myParent = id;
		}		

		if (jumpTimer == 30)
		{
			yspeed = -4.5;
			xspeed = screenPos ? -2 : 2;
			if (instance_exists(mySickle))
			{
				with (mySickle)
				{
					if (phase == 0)
					{
						isLocked = false;
						xspeed = (12 * other.image_xscale);
						yspeed = -1;
						phase = 1;
						phaseTimer = 0;
						x += (8 * other.image_xscale);
						play_sfx(sfxBomberheadThrow);
						other.isThrow = true;
					}
				}
			}
		}
		if (grounded()) //reset timer
		{
			if (!setGround)
			{
				jumpTimer = 0;
				xspeed = 0;
				setGround = true;
				isThrow = false;
			}
		}
		else
		{
			setGround = false;			
		}
		
		jumpTimer++;
		
		wave_update();

		if (phaseTimer >= phaseTime) //goto basaquer
		{
			phase++;
			phaseTimer = 0;
			var _newX = irandom_range((global.viewX + 64), (global.viewX + (global.viewW - 64)));
			init_new_phase(_newX, 80, (_newX - 32), 192, 1.00, 1.00);
			hasGravity = false;
			hasCollision = false;
			if (instance_exists(objBomberheadSickle))
			{
				instance_destroy(objBomberheadSickle);
			}
			jumpTimer = 0;
			if (instance_exists(objPlayer))
			{
				instance_create_depth((x - 16), bbox_bottom, depth, objBasaquerFlameProjectile);
			}
		}
		break;
	case 3: //basaquer
		visible = (phaseTimer % 2 == 0);
		
		if (phaseTimer % 50 == 0)
		{
			if (instance_exists(objPlayer))
			{
				instance_create_depth((x - 16), bbox_bottom, depth, objBasaquerFlameProjectile);
				x = irandom_range((global.viewX + 64), (global.viewX + (global.viewW - 64)));
			}
		}
		
		wave_update();
		
		if (phaseTimer >= phaseTime) //goto kelbeross
		{
			phase++;
			phaseTimer = 0;
			init_new_phase(288, 144, 288, 192, 1.00, 1.00);
			hasGravity = true;
			hasCollision = true;
			jumpTimer = 0;
			if (instance_exists(objBasaquerFireWave))
			{
				instance_destroy(objBasaquerFireWave);
			}
			if (instance_exists(objBasaquerFlameProjectile))
			{
				instance_destroy(objBasaquerFlameProjectile);
			}
		}
		break;
	case 4: //kelbeross
		visible = (phaseTimer % 2 == 0);
		
		if (grounded())
		{
			xspeed = 0;
			if (++jumpTimer == 15)
			{
				yspeed = -6;
				jumpTimer = 0;
			}
		}
		else
		{
			xspeed = (3 * -image_xscale);
		}
		
		//shooteng
		var _shootTime = 60;
		if (phaseTimer % _shootTime == 0 && phaseTimer != 0)
		{
			var _bullet = instance_create_depth((x + (15 * image_xscale)), (y - 18), (depth - 1), objGenericBullet);
				_bullet.sprite_index = sprKelberossBullet;
				_bullet.xspeed = (6 * -image_xscale);
				_bullet.image_xscale = -image_xscale;
				_bullet.contactDamage = 2;
				_bullet.imgSpd = (1 / 2);
		}
		
		wave_update();

		if (phaseTimer >= phaseTime) //goto malth
		{
			phase++;
			phaseTimer = 0;
			init_new_phase(64, 160, 288, 192, 1.00, -1.00);
			hasGravity = false;
			hasCollision = false;
		}
		break;
	case 5: //malth
		visible = (phaseTimer % 2 == 0);
		
		if (phaseTimer % 40 == 0 && phaseTimer > 20)
		{
			var _height = (++attackCount % 2 == 0) ? 9 : 3;
			var _yOffset = (attackCount % 2 == 0) ? 32 : -16; //make these 24 and 56 when the sprites
			lightning_pillar_create((x + 16), (y - _yOffset), _height);
		}
		else if (((phaseTimer % 40) - 20) == 0)
		{
			summon_lightning();
		}
		
		wave_update();
		
		if (phaseTimer >= phaseTime) //goto masked devil
		{
			phase++;
			phaseTimer = 0;
			init_new_phase(224, 192, 128, 192, 1.00, 1.00);
			hasGravity = false;
			hasCollision = false;
			if (instance_exists(objGenericBullet))
			{
				instance_destroy(objGenericBullet);
			}
			if (instance_exists(objBloodyMalthLightningSummon))
			{
				instance_destroy(objBloodyMalthLightningSummon);
			}
		}
		break;
	case 6: //masked devil
		visible = (phaseTimer % 2 == 0);
		
		if (!instance_exists(objMaskedDevilShield))
		{
			for (var i = 0; i < shieldTotal; i++)
			{
				_shield = instance_create_depth((x - 16), y, depth, objMaskedDevilShield);
				_shield.locus = id;
				_shield.myCore = id;
				_shield.thetaOffset = i;
				_shield.canBeHit = false;
				if (i > 0) //basically the point of this is to make all of the shields have the same theta
				{
					with (_shield)
					{
						fix_theta();
					}	
				}
			}
			play_sfx(sfxFlameWeapon);
		}
		else
		{
			with (objMaskedDevilShield)
			{
				radius++;
			}			
		}
		
		wave_update();
		
		if (phaseTimer >= phaseTime) //goto jaquio
		{
			phase++;
			phaseTimer = 0;
			init_new_phase(irandom_range((global.viewX + 64), (global.viewX + (global.viewW - 64))), irandom_range((global.viewY + 96), (global.viewY + (global.viewH - 96))), 32, 192, 1.00, 1.00);
			hasGravity = false;
			hasCollision = false;
			if (instance_exists(objMaskedDevilShield))
			{
				instance_destroy(objMaskedDevilShield);
			}
			waveLength = 64;
			fire_eight_way_spread((x - 16), y);
			play_sfx(sfxFlameWeapon);
		}
		break;
	case 7: //jaquio
		visible = (phaseTimer % 2 == 0);
		
		canHit = false;
		
		wave_update(0.025);

		amplitude += ampDir;
		amplitude = clamp(amplitude, 0, 256);

		if (amplitude <= 0) //warping back in
		{
			if (ampDir == -1)
			{
				ampDir = 1;
			}
		}
		else if (amplitude >= 64) //warping out
		{
			if (ampDir == 1)
			{
				instance_destroy(id);
			}
		}		
		break;
}
phaseTimer++;

if (phaseTimer % 2 == 0)
{
	phaseMod = !phaseMod;
}