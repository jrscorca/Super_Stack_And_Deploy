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
}

-(void) draw{
    ccDrawColor4F(255,255,0,1);
    CGSize limit = MDM.boardSize;
    float widthLimit = limit.width;
    float heightLimit = limit.height;
    ccDrawRect(viewRect,  ccpAdd(viewRect, ccp((480/widthLimit) *MINIMAP_RECT.size.width, (320/heightLimit) * MINIMAP_RECT.size.height ))  );
    
    
    ccDrawColor4F(255,0,0,1);
    ccDrawRect(self.position, ccp(MINIMAP_RECT.size.width, MINIMAP_RECT.size.height));
    [super draw];
}

@end
