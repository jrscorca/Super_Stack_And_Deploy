//
//  BoardItemSprite.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/2/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BoardItemSprite.h"
#import "MatchDataManager.h"
#import "Status.h"
#import "BoardItemModel.h"


@implementation BoardItemSprite

@synthesize model;

-(id)initWithFile:(NSString *)filename{
    if(self = [super initWithFile:@"Icon.png"]){
        self.model = [[[BoardItemModel alloc] init] autorelease];
        [self addToArray:MDM.boardItems];
    }
    return self;
}

-(void)update:(ccTime)dt{
    for (Status *status in model.statuses){
        [status updateStatus:dt];
    }
}

-(void)dealloc{
    [model release];
    [super dealloc];
}

@end
