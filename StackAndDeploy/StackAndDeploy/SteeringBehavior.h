//
//  SteeringBehavior.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/3/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class GameObjectSprite, ShipSprite, BoardItemSprite;
@interface SteeringBehavior : NSObject{
    ShipSprite *myShip;
    BoardItemSprite *gameObject;
    CGPoint objective;
    steeringType steering;
}

@property (nonatomic, assign) ShipSprite* myShip;
@property (nonatomic, assign) BoardItemSprite *gameObject;
@property CGPoint objective;
@property steeringType steering;

-(id)initWithShip:(ShipSprite*) ship;

-(void)targetSprite:(GameObjectSprite*)sprite;

-(void) clearTargetSprite;

-(CGPoint) updateMovement;

-(CGPoint) arriveMovement:(CGPoint) destination;

@end
