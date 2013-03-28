//
//  PlayLAyer.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class HUDLayer, BoardLayer;
@interface PlayLayer : CCLayer{
    HUDLayer *hudLayer;
    BoardLayer *boardLayer;
    
}

@property (nonatomic, assign) HUDLayer *hudLayer;
@property (nonatomic, assign) BoardLayer *boardLayer;

+ (id)scene;

-(void) update:(ccTime)dt;


@end
