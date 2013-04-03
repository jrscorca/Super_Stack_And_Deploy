//
//  Ship.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ShipSprite.h"
#import "ShipVO.h"
#import "UtilityFunctions.h"
#import "MatchDataManager.h"
#import "ShipModel.h"


@implementation ShipSprite

@synthesize isSelected, objective, model;

-(id)initWithShipVO:(ShipVO*)shipVO{
    if(self = [super initWithFile:@"Icon.png"]){
        model = [[[ShipModel alloc] init] autorelease];
        velocity = ccp(1,1);
        objective = ccp(200,200);
        isSelected = NO;
        [self addToArray:MDM.ships];
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
	CGFloat weaponRange = 00;
	
	CGPoint offsetVector = ccpNormalize(ccpSub(enemyPosition, self.position));
    
    //CGPoint desiredTargetPosition = ccpMult(offsetVector, weaponRange);

	CGPoint source = ccpNormalize(ccpSub(self.position, enemyPosition));

	
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
        CGPoint desiredDirection = ccp(enemyPosition.x - self.position.x, enemyPosition.y - self.position.y);
        turningVel = ccpNormalize(desiredDirection);
    }
	
	
    //CGPoint targetOffset = ccpSub(enemyPosition, desiredTargetPosition);

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

-(void)dealloc{
    [model release];
    [super dealloc];
}

@end
