//
//  CommandLayer.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@class ShipSprite, NodeSprite;
@interface CommandLayer : CCLayer {
    CCMenu *commandMenu;
    CCMenuItemSprite *commandItem0, *commandItem1, *commandItem2, *commandItem3;
    
}

-(void) commandPressed:(id)sender;

-(void) enableButton:(NSNotification*) notification;

-(void)changeCommands:(NSNotification*) notification;

-(void) shipCommands:(ShipSprite*) ship;
-(void) nodeCommands:(NodeSprite*) node;
@end
