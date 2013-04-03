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
#import "SteeringBehavior.h"

@implementation ShipSprite

@synthesize isSelected, objective, steeringBehavior, velocity, model;

-(id)initWithShipVO:(ShipVO*)shipVO{
    if(self = [super initWithFile:@"Icon.png"]){
        model = [[[ShipModel alloc] init] autorelease];
        velocity = ccp(1,1);
        objective = ccp(200,200);
        isSelected = NO;
        [self addToArray:MDM.ships];
        self.steeringBehavior = [[[SteeringBehavior alloc] initWithShip:self] autorelease];
    }
    return self;
}

-(void) dealloc{
    [steeringBehavior release];
    steeringBehavior = nil;
    [model release];
    [super dealloc];
}


-(void) update:(ccTime) dt{

    velocity = [steeringBehavior updateMovement]; //[self movement:objective];
    self.position = ccpAdd(self.position, ccpMult(velocity, 1));
    
}



-(void)moveShip:(CGPoint)touch{
    
    self.steeringBehavior.objective = touch;
}

@end
