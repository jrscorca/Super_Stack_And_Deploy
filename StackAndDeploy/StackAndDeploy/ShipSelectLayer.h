//
//  ShipSelectLayer.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/31/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class ShipSprite;
@interface ShipSelectLayer : CCLayer {
    CCLabelTTF *healthLabel;
    CCLabelTTF *shipNameLabel;
    ShipSprite *selectedShip;
}

@property (nonatomic, assign) CCLabelTTF *healthLabel, *shipNameLabel;

-(void) update:(ccTime)dt;

-(void) shipSelected:(NSNotification*) notification;

@end
