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

@class ShipVO, ShipModel,SteeringBehavior, GameObjectSprite;
@interface ShipSprite : BoardItemSprite {
    CGPoint velocity;
    BOOL isSelected;
    
    SteeringBehavior *steeringBehavior;
    
}

@property (nonatomic) BOOL isSelected;
@property (nonatomic) CGPoint velocity;
@property (nonatomic, retain) SteeringBehavior *steeringBehavior;
//@property (nonatomic, retain) ShipModel *model;


-(id)initWithShipVO:(ShipVO*)shipVO;


-(CGPoint) movement:(CGPoint) destination;

//

-(void)moveShip:(CGPoint)touch;

-(void)moveShipToSprite:(GameObjectSprite*)sprite;

@end
