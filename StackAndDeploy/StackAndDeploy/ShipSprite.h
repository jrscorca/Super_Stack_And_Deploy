//
//  ShipSprite.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BoardItemSprite.h"

@class ShipVO, ShipModel,SteeringBehavior;
@interface ShipSprite : BoardItemSprite {
    CGPoint velocity;
    CGPoint objective;
    BOOL isSelected;
    ShipModel *model;
    
    SteeringBehavior *steeringBehavior;
}

@property (nonatomic) BOOL isSelected;
@property (nonatomic) CGPoint objective, velocity;
@property (nonatomic, retain) SteeringBehavior *steeringBehavior;
@property (nonatomic, retain) ShipModel *model;


-(id)initWithShipVO:(ShipVO*)shipVO;

-(void) update:(ccTime) dt;

-(CGPoint) movement:(CGPoint) destination;

//

-(void)moveShip:(CGPoint)touch;

@end
