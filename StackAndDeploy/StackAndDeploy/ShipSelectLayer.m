//
//  ShipSelectLayer.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/31/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ShipSelectLayer.h"
#import "MatchDataManager.h"

@implementation ShipSelectLayer

-(id) init{
    if(self = [super init]){
 //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(drawCard:) name:kNotification_CardDrawLocal object:nil];
//        CGSize winSize = [[CCDirector sharedDirector] winSize];
        CCSprite *hud = [CCSprite spriteWithFile:@"abilities.png"];
        hud.position = ccp(425, 47);
        [self addChild:hud];
        
    }
    return self;
}

-(void) update:(ccTime)dt{
    //board limit
/*  CGSize limit = MDM.boardSize;
    float widthLimit = -limit.width;
    float heightLimit = -limit.height;
    CGPoint pos = boardLayer.position;
    //find percent
    viewRect = ccp((pos.x/widthLimit) * MINIMAP_RECT.size.width, (pos.y/heightLimit) * MINIMAP_RECT.size.height);
    */
}



@end
