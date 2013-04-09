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
#import "PlayerClass.h"
#import "LocalPlayer.h"
#import "MatchDataManager.h"
#import "CommandLayer.h"
#import "DetailsLayer.h"

@implementation HUDLayer

@synthesize handLayer, miniMapLayer, detailsLayer, commandLayer;

- (id)init{
    if ((self = [super init])) {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        CCSprite *hud = [CCSprite spriteWithFile:@"overlay.png"];
        hud.position = ccp(winSize.width/2, 75);
        [self addChild:hud];
        
        self.handLayer = [HandLayer node];
        [self addChild:self.handLayer];
        
        self.miniMapLayer = [MiniMapLayer node];
        [self addChild:self.miniMapLayer];
        
        self.detailsLayer = [DetailsLayer node];
        [self addChild:self.detailsLayer];
        self.detailsLayer.visible = NO;
        
        self.commandLayer = [CommandLayer node];
        [self addChild:self.commandLayer];
        self.commandLayer.visible = NO;
        
        resourceLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%.0f", 0.0] fontName:@"helvetica" fontSize:14];

        resourceLabel.position = ccp(winSize.width- 70, 300);
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
    [self.detailsLayer update:dt];
    [self.commandLayer update:dt];
    [resourceLabel setString:[NSString stringWithFormat:@"%.0f", MDM.localPlayer.resources]];
}



@end
