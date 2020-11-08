/// @description Custom variables
hasCollision = true;
hasGravity = true;

healthPoints = 16;

xAxis = 0;
yAxis = 0;

onGround = grounded();

jumpSpeed = 4.16;
runSpeed = 2;
grav = 0.16;
maxVelocity = 5;
airBackwardsSpeed = 0.75;
wallClimbSpeed = 1;

isDuck = false;
isWallClimb = false;
canWallClimb = true;
isHang = false;
canHang = true;

myWall = noone;
climbSolidDistance = 4;

myRail = noone;

isKnockback = false;
iFrameTime = 26;
iFrameTimer = 0;
hitObject = noone;
isHit = false;
isDead = false;

currentState = playerStateGround;
stateIsNew = true;
stateTimer = 0;

imgSpd = 0;
attackAnimTimer = 0;
currentAttack = 0; //0 = none; 1 = sword; 2 = weapon; 3 = long sword
hasAttacked = true;

projectileOffsetX = 15;
projectileOffsetY = -22;
cooldownTimer = 0;