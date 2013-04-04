//
//  BoardItemSprite.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/2/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BoardItemSprite.h"
#import "MatchDataManager.h"


@implementation BoardItemSprite

//@synthesize model;

-(id)init{
    if(self = [super initWithFile:@"Icon.png"]){
        [self addToArray:MDM.boardItems];
    }
    return self;
}


@end
