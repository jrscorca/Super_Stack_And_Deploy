//
//  PlayLAyer.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "PlayLayer.h"
#import "HUDLayer.h"
#import "BoardLayer.h"
#import "MatchDataManager.h"

@implementation PlayLayer

@synthesize hudLayer, boardLayer;

+ (id)scene {
    CCScene *scene = [CCScene node];
    
    // 'layer' is an autorelease object.
	PlayLayer *layer = [PlayLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];

    return scene;
}


-(id) init{
    if(self = [super init]){
        self.boardLayer = [[[BoardLayer alloc] init] autorelease];
        [self addChild:self.boardLayer];
        
        self.hudLayer = [[[HUDLayer alloc] init]autorelease];
        [self addChild:self.hudLayer];
        
        
        [self scheduleUpdate];
    }
    return self;
}


-(void) update:(ccTime) dt{
    [self.hudLayer update:dt];
    [self.boardLayer update:dt];
    MatchDataManager *MDM = [MatchDataManager sharedInstance];
    [MDM.localPlayer update:dt];
    [MDM.awayPlayer update:dt];
    
    
}

@end
