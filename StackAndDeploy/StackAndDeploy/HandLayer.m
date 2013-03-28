//
//  HandLayer.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "HandLayer.h"
#import "MatchDataManager.h"
#import "PlayerClass.h"
#import "CardItem.h"
#import "CardVO.h"

@implementation HandLayer

@synthesize handArray;

-(id) init{
    if(self = [super init]){
        self.handArray = [NSMutableArray array];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(drawCard:) name:kNotification_CardDrawLocal object:nil];
        //draw cards
    }
    return self;
}

//draws card for local player
-(void) drawCard:(NSNotification*) notification{
    CardVO *card = notification.object;
    CardItem* cardItem = [[[CardItem alloc] initWithCardVO:card] autorelease];
    [self addChild:cardItem];
    [self.handArray addObject:cardItem];
    [self organizeHand];
}

-(void) organizeHand{
    for(int i = 0; i < [self.handArray count]; i++){
        CardItem *cardItem = [self.handArray objectAtIndex:i];
        cardItem.position = ccp(0 + i * cardItem.boundingBox.size.width, 44);
    }
}


-(void) update:(ccTime) dt{

}



@end
