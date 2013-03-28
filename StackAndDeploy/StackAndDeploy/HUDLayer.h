//
//  HUDLayer.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class HandLayer;
@interface HUDLayer : CCLayer {
    HandLayer *handLayer;
}
@property (nonatomic, assign) HandLayer *handLayer;


-(void) update:(ccTime)dt;

@end
