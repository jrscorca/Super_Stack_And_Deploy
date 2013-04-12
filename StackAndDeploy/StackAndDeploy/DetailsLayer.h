//
//  DetailsLayer.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/9/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class GameObjectSprite, ShipSprite, NodeSprite, Ability;
@interface DetailsLayer : CCLayer {
    CCLabelTTF *healthLabel;
    CCLabelTTF *nameLabel;
    GameObjectSprite *selectedSprite;
    Ability *ability;
}

@property (nonatomic, assign) CCLabelTTF *nameLabel, *healthLabel;
@property (nonatomic, retain) Ability *ability;

-(void) update:(ccTime)dt;

-(void) abilitySelected:(NSNotification*) notification;
-(void) spriteSelected:(NSNotification*) notification;


-(void) setupShipInterface:(ShipSprite*) ship;
-(void) setupNodeInterface:(NodeSprite*) node;
-(void) setupAbilityInterface:(Ability*) _ability;


-(void) updateShipInterface:(ShipSprite*) ship;
-(void) updateNodeInterface:(NodeSprite*) node;
-(void) updateAbilityInterface:(Ability*) _ability;

@end
