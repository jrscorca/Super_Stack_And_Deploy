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

-(void) draw{
    ccDrawColor4F(255,255,0,1);
    //CGSize limit = MDM.boardSize;
    //float widthLimit = limit.width;
    //float heightLimit = limit.height;
    //ccDrawRect(ccpAdd(viewRect, ccp(160,0)) ,  ccpAdd(viewRect, ccp((480/widthLimit) *MINIMAP_RECT.size.width, (320/heightLimit) * MINIMAP_RECT.size.height ))  );
    ccDrawColor4F(255,0,0,1);
    ccDrawRect(ccpAdd(self.position, ccp(160,0)), ccp(MINIMAP_RECT.size.width, MINIMAP_RECT.size.height));
    [super draw];
}


@end
