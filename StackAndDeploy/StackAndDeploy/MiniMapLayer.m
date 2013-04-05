//
//  MiniMapLayer.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/30/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "MiniMapLayer.h"
#import "HUDLayer.h"
#import "PlayLayer.h"
#import "BoardLayer.h"
#import "MatchDataManager.h"

@implementation MiniMapLayer

@synthesize boardLayer;

-(id) init{
    if(self = [super init]){
   /*     CCSprite *background = [CCSprite spriteWithFile:@"Icon-Small.png"];
        background.scale = 4;
//        background.opacity = ;
        background.position = ccp(40,40);
        [self addChild:background];*/

    }
    return self;
}


-(void) update:(ccTime)dt{
    
    //board limit
    CGSize limit = MDM.boardSize;
    float widthLimit = -limit.width;
    float heightLimit = -limit.height;
    CGPoint pos = boardLayer.position;
    
    
    //find percent
    viewRect = ccp((pos.x/widthLimit) * MINIMAP_RECT.size.width, (pos.y/heightLimit) * MINIMAP_RECT.size.height);
    viewRect = ccpAdd(ccp(MINIMAP_RECT.origin.x, MINIMAP_RECT.origin.y), viewRect);
}

-(void) draw{
    ccDrawColor4F(255,255,0,1);
    CGSize limit = MDM.boardSize;
    float widthLimit = limit.width;
    float heightLimit = limit.height;
    ccDrawRect(viewRect,  ccpAdd(ccpSub(viewRect, ccp(MINIMAP_RECT.origin.x, MINIMAP_RECT.origin.y)), ccp((480/widthLimit) *MINIMAP_RECT.size.width, (320/heightLimit) * MINIMAP_RECT.size.height ))  );
    
    
    ccDrawColor4F(255,0,0,1);
    ccDrawRect(ccp(MINIMAP_RECT.origin.x, MINIMAP_RECT.origin.y), ccp(MINIMAP_RECT.size.width, MINIMAP_RECT.size.height));
    [super draw];
}

@end
