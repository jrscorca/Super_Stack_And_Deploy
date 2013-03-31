//
//  HUDLayer.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class HandLayer, MiniMapLayer;
@interface HUDLayer : CCLayer {
    HandLayer *handLayer;
    MiniMapLayer *miniMapLayer;
}
@property (nonatomic, assign) HandLayer *handLayer;
@property (nonatomic, assign) MiniMapLayer *miniMapLayer;

-(void) update:(ccTime)dt;

@end
