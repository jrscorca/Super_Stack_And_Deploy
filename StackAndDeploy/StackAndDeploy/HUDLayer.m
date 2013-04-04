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
#import "ShipSelectLayer.h"
#import "PlayerClass.h"
#import "LocalPlayer.h"
#import "MatchDataManager.h"

@implementation HUDLayer

@synthesize handLayer, miniMapLayer, shipSelectLayer;

- (id)init{
    if ((self = [super init])) {
        self.handLayer = [HandLayer node];
        [self addChild:self.handLayer];
        
        self.miniMapLayer = [MiniMapLayer node];
        [self addChild:self.miniMapLayer];
        
        self.shipSelectLayer = [ShipSelectLayer node];
        [self addChild:self.shipSelectLayer];
        self.shipSelectLayer.visible = NO;
        
        resourceLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"resources: %d", 0] fontName:@"helvetica" fontSize:14];
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        resourceLabel.position = ccp(winSize.width- 50, 20);
        [self addChild:resourceLabel];
        
    }
    return self;
}

-(void) dealloc{
    [super dealloc];
}

-(void) update:(ccTime)dt{
    [self.handLayer update:dt];
    [self.miniMapLayer update:dt];
    [self.shipSelectLayer update:dt];
    [resourceLabel setString:[NSString stringWithFormat:@"resources: %f", MDM.localPlayer.resources]];
}



@end
