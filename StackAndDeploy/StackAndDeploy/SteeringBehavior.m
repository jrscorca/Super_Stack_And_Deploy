//
//  SteeringBehavior.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/3/13.
//
//

#import "SteeringBehavior.h"
#import "UtilityFunctions.h"
#import "ShipSprite.h"



@implementation SteeringBehavior

@synthesize steering, gameObject, myShip, objective;

-(id)initWithShip:(ShipSprite*) ship{
    if(self = [super init]){
        self.objective = ccp(200,200);
        [ship assignObjectToPointer:&myShip];
        steering = MOVETO;
    }
    return self;
}

-(void) dealloc{
    [myShip removeObjectFromPointer:&myShip];
    [super dealloc];
}

-(CGPoint) updateMovement{
//    if(
    switch (steering) {
        case MOVETO:
            return [self arriveMovement:objective];
            break;
            
        default:
            NSLog(@"steeringBehavior bug");
            break;
    }
    return CGPointZero;
    
}


-(CGPoint) arriveMovement:(CGPoint) destination
{
	
	CGFloat maxSpeed = 1.5;
	CGFloat maxForce = 1.1;
	CGFloat maxTurn = .7;
    
    CGPoint forward = ccpNormalize(myShip.velocity);
	CGPoint enemyPosition = destination;
	CGFloat weaponRange = 00;
	
    
    CGPoint offsetDirection =ccpSub(enemyPosition, myShip.position);
	CGPoint offsetVector = ccpNormalize(offsetDirection);
    
    //CGPoint desiredTargetPosition = ccpMult(offsetVector, weaponRange);
    
	CGPoint source = ccpNormalize(ccpSub(myShip.position, enemyPosition));
    
	
	CGFloat xAxisangle = atan2(forward.y, forward.x) * -1;
	
	
	CGFloat newX = source.x*cos(xAxisangle) - source.y * sin(xAxisangle);
	CGFloat newY = source.x*sin(xAxisangle) + source.y * cos(xAxisangle);
	CGPoint newSource = CGPointMake(newX, newY);
	
	CGFloat turning = atan2(newSource.y, newSource.x);
	CGPoint turningVel = forward;
    
    //clamps turning to max turn if not heading towards object
	if(  turning > (-1 * M_PI) + (maxTurn) && turning < 0){
		turningVel = CGPointMake(forward.x * cos(maxTurn) - forward.y * sin(maxTurn), forward.x* sin(maxTurn) + forward.y * cos(maxTurn));
	}else if( turning < (M_PI) - (maxTurn) && turning >= 0){
		maxTurn = -1 * maxTurn;
		turningVel = CGPointMake(forward.x * cos(maxTurn) - forward.y * sin(maxTurn), forward.x* sin(maxTurn) + forward.y * cos(maxTurn));
	}else{
        //normalize a direction straight to objective
        CGPoint desiredDirection = ccp(enemyPosition.x - myShip.position.x, enemyPosition.y - myShip.position.y);
        turningVel = ccpNormalize(desiredDirection);
    }
	
	
    
    
    
    //target_offset = target - position
//    distance = length (target_offset)
    
    float distance = ccpLength(offsetDirection);
//    ramped_speed = max_speed * (distance / slowing_distance)
    float rampedSpeed = maxSpeed * (distance/ 50);
  //  clipped_speed = minimum (ramped_speed, max_speed)
    float clippedSpeed = MIN(rampedSpeed, maxSpeed);
   // desired_velocity = (clipped_speed / distance) * target_offset
    //steering = desired_velocity - velocity
    
    
    
    //CGPoint targetOffset = ccpSub(enemyPosition, desiredTargetPosition);
    
    //    CGPoint newOffset = ccpSub(self.position, targetOffset);
	
    CGPoint desiredVelPlayer = ccpMult(ccpNormalize(turningVel), clippedSpeed);
    CGPoint truncIt = ccpMult(ccpNormalize(desiredVelPlayer), clippedSpeed);
    
    
    CGPoint steeringDirection = ccpSub(truncIt, myShip.velocity);
    CGPoint steeringForce = [UtilityFunctions truncate:steeringDirection toMax:maxForce];
	
    CGPoint acceleration = ccpMult(steeringForce, 0.2);
    
    
	CGPoint newVelocity = [UtilityFunctions truncate:ccpAdd(acceleration, myShip.velocity) toMax:clippedSpeed];
    
	return ccpMult(newVelocity, 1);
}



@end
