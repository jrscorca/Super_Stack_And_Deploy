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

#import "ShipSprite.h"
#import "UINormalState.h"
#import "UIState.h"
#import "GameObjectSprite.h"
#import "MiniMapLayer.h"
#import "PlayerClass.h"


@implementation PlayLayer

@synthesize hudLayer, boardLayer, uiState;

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
        
        self.hudLayer = [[[HUDLayer alloc] init] autorelease];
        [self addChild:self.hudLayer];
        self.hudLayer.miniMapLayer.boardLayer = self.boardLayer;
        self.uiState = [[[UINormalState alloc] init] autorelease];
        [UIState setPlayLayer:self];
        
        
        [self scheduleUpdate];
        
        isTouchEnabled_ = YES;
        for (int i = 0; i < INITIAL_HAND_SIZE; ++i) [MDM.localPlayer drawCardFromDeck];

        
        
//        NSMutableArray *
        
        //Sample of how to use GameObjectSpritePointers
        
     /*   Ship *ship = [[[Ship alloc] initWithFile:@"Icon-Small.png"] autorelease];
//        [[[[Ship alloc] init] autorelease] assignObjectToPointer:&ship];
        
        Ship *anotherPointer = nil;

        
        NSLog(@"ship %@", ship);
        NSLog(@"naother %@", anotherPointer);
        [ship assignObjectToPointer:&anotherPointer];
        NSLog(@"ship %@", ship);
        NSLog(@"naother %@", anotherPointer);
        
        [anotherPointer removeObjectFromPointer:&anotherPointer];
        NSLog(@"ship %@", ship);
        NSLog(@"naother %@", anotherPointer);
        
        [ship assignObjectToPointer:&anotherPointer];
        NSLog(@"ship %@", ship);
        NSLog(@"naother %@", anotherPointer);
        
        [ship destroyObject];
        NSLog(@"ship %@", ship);
        NSLog(@"naother %@", anotherPointer);
        
        //calling this on null pointer is safe
        [anotherPointer removeObjectFromPointer:&anotherPointer];
        */
        
        
    }
    return self;
}


-(void) pointerTest:(Ship**) ship{
    *ship = nil;
    
}

-(void) update:(ccTime) dt{
    [MDM cleanupGameObjects];
    [self.uiState updateState:dt];
    [self.hudLayer update:dt];
    [self.boardLayer update:dt];
    [MDM.localPlayer update:dt];
    [MDM.awayPlayer update:dt];
    
    
}


-(void) registerWithTouchDispatcher
{
    [[CCDirector sharedDirector].touchDispatcher addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

-(void) changeUIState:(UIState*) _uiState{
    self.uiState = _uiState;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    return [self.uiState ccTouchBegan:touch withEvent:event];
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    [self.uiState ccTouchMoved:touch withEvent:event];
}
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    [self.uiState ccTouchEnded:touch withEvent:event];
}

- (void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event{
    [self.uiState ccTouchCancelled:touch withEvent:event];
}


@end
