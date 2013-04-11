//
//  CardItem.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "CardItem.h"
#import "CardVO.h"
#import "MatchDataManager.h"
#import "CardModel.h"

@implementation CardItem

@synthesize model;

-(id) initWithCardVO:(CardVO*) cardVO{
    if(self = [super initWithFile:@"Icon-72.png"]){
        self.model = [[[CardModel alloc] initWithCardVO:cardVO] autorelease];
        [self addToArray:MDM.cardItems];
    }
    return self;
}


-(void) dealloc{
    [model release];
    [super dealloc];
}

@end
