//
//  HUDLayer.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "HUDLayer.h"
#import "HandLayer.h"
#import "MiniMapLayer.h"


@implementation HUDLayer

@synthesize handLayer, miniMapLayer;

- (id)init{
    if ((self = [super init])) {
        self.handLayer = [HandLayer node];
        [self addChild:self.handLayer];
        
        self.miniMapLayer = [MiniMapLayer node];
        [self addChild:self.miniMapLayer];
    }
    return self;
}

-(void) dealloc{
    [super dealloc];
}

-(void) update:(ccTime)dt{
    [self.handLayer update:dt];
    [self.miniMapLayer update:dt];
}


@end
