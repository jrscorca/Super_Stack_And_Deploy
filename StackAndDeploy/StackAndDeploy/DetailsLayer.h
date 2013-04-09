//
//  DetailsLayer.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/9/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class GameObjectSprite, ShipSprite, NodeSprite;
@interface DetailsLayer : CCLayer {
    CCLabelTTF *healthLabel;
    CCLabelTTF *nameLabel;
    GameObjectSprite *selectedSprite;
}

@property (nonatomic, assign) CCLabelTTF *nameLabel, *healthLabel;

-(void) update:(ccTime)dt;

-(void) spriteSelected:(NSNotification*) notification;


-(void) setupShipInterface:(ShipSprite*) ship;
-(void) setupNodeInterface:(NodeSprite*) node;


-(void) updateShipInterface:(ShipSprite*) ship;
-(void) updateNodeInterface:(NodeSprite*) node;

@end
