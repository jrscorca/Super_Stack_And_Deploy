//
//  MiniMapLayer.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/30/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class BoardLayer;
@interface MiniMapLayer : CCLayer {
    BoardLayer *boardLayer;
    CGPoint viewRect;
}

@property (nonatomic, retain) BoardLayer *boardLayer;

-(void) update:(ccTime)dt;

@end
