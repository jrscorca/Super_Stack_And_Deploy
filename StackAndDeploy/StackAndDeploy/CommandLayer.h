//
//  CommandLayer.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CommandLayer : CCLayer {
    CCMenu *commandMenu;
}

-(void) commandPressed:(id)sender;

-(void) enableButton:(NSNotification*) notification;

@end
