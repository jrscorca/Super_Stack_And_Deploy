//
//  HandLayer.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class CardItem;
@interface HandLayer : CCLayer {
}


-(void) drawCard:(NSNotification*) notification;

-(void) organizeHand;

-(void) update:(ccTime)dt;



@end
