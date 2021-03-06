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

@synthesize library, resources;

-(id) init{
    if(self = [super init]){
        resources = 10;
        drawCardCounter = 10;
        self.library = [[[Library alloc] init] autorelease];
        //start off with 5 cards
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
        drawCardCounter = 2;
        [self drawCardFromDeck];
    }
}



@end
