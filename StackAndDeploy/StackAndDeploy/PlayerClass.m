//
//  PlayerClass.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "PlayerClass.h"
#import "Library.h"
#import "CardItem.h"

@implementation PlayerClass

@synthesize library;

-(id) init{
    if(self = [super init]){
        drawCardCounter = 10;
        self.library = [[[Library alloc] init] autorelease];
        //start off with 5 cards
        for (int i = 0; i < INITIAL_HAND_SIZE; ++i) [self drawCardFromDeck];
    }
    return self;
}


-(void) dealloc{
    [library release];
    [super dealloc];
}

-(void) update:(ccTime) dt{
    drawCardCounter -= dt;
    if(drawCardCounter < 0){
        drawCardCounter = 10;
        [self drawCardFromDeck];
    }
}



@end
