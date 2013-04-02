//
//  Ship.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Ship.h"
#import "ShipVO.h"
#import "UtilityFunctions.h"


@implementation Ship

@synthesize isSelected, objective;

-(id)initWithShipVO:(ShipVO*)shipVO{
    if(self = [super initWithFile:@"Icon.png"]){
        velocity = ccp(1,1);
        objective = ccp(200,200);
        isSelected = NO;
    }
    return self;
}

-(void) update:(ccTime) dt{

    velocity = [self movement:objective];
    self.position = ccpAdd(self.position, velocity);
    
}

-(CGPoint) movement:(CGPoint) destination
{
	
	CGFloat maxSpeed = 3;
	CGFloat maxForce = 1.3;
	CGFloat maxTurn = .8;
    
    CGPoint forward = ccpNormalize(velocity);
	CGPoint enemyPosition = destination;
	CGFloat weaponRange = 50;
	
	CGPoint offsetVector = ccpNormalize(ccpSub(enemyPosition, self.position));
    
    CGPoint desiredTargetPosition = ccpMult(offsetVector, weaponRange);

	CGPoint source = ccpNormalize(ccpSub(self.position, enemyPosition));

	
	CGFloat xAxisangle = atan2(forward.y, forward.x) * -1;
	
	
	CGFloat newX = source.x*cos(xAxisangle) - source.y * sin(xAxisangle);
	CGFloat newY = source.x*sin(xAxisangle) + source.y * cos(xAxisangle);
	CGPoint newSource = CGPointMake( newX, newY);
	
	CGFloat turning = atan2(newSource.y, newSource.x);
	
	CGPoint turningVel = forward;
	if(  turning > (-1 * M_PI) + (maxTurn) && turning < 0){
		turningVel = CGPointMake(forward.x * cos(maxTurn) - forward.y * sin(maxTurn), forward.x* sin(maxTurn) + forward.y * cos(maxTurn));
	}
    if( turning < (M_PI) - (maxTurn) && turning >= 0){
		maxTurn = -1 * maxTurn;
		turningVel = CGPointMake(forward.x * cos(maxTurn) - forward.y * sin(maxTurn), forward.x* sin(maxTurn) + forward.y * cos(maxTurn));
	}
	
	
    CGPoint targetOffset = ccpSub(enemyPosition, desiredTargetPosition);

//    CGPoint newOffset = ccpSub(self.position, targetOffset);
	
    CGPoint desiredVelPlayer = ccpMult(ccpNormalize(turningVel), maxSpeed);
    CGPoint truncIt = ccpMult(ccpNormalize(desiredVelPlayer), maxSpeed);
    

    CGPoint steeringDirection = ccpSub(truncIt, velocity);
    CGPoint steeringForce = [UtilityFunctions truncate:steeringDirection toMax:maxForce];
	
    CGPoint acceleration = ccpMult(steeringForce, 0.2);

    
	CGPoint newVelocity = [UtilityFunctions truncate:ccpAdd(acceleration, velocity) toMax:maxSpeed];

	return newVelocity;	
}


-(void)moveShip:(CGPoint)touch{
    
    self.objective = touch;
}


@end
