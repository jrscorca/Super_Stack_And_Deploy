//
//  SteeringBehavior.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/3/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class GameObjectSprite, ShipSprite;
@interface SteeringBehavior : NSObject{
    ShipSprite *myShip;
    GameObjectSprite *gameObject;
    CGPoint objective;
    steeringType steering;
}

@property (nonatomic, assign) ShipSprite* myShip;
@property (nonatomic, assign) GameObjectSprite *gameObject;
@property CGPoint objective;
@property steeringType steering;

-(id)initWithShip:(ShipSprite*) ship;

-(CGPoint) updateMovement;

-(CGPoint) arriveMovement:(CGPoint) destination;

@end
