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
        isTouchEnabled_ = YES;
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

-(void)cardPLayed{

}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {

    CGPoint touchPoint = [self convertTouchToNodeSpace: touch];
    for (CardItem *card in handArray){
        if (CGRectContainsPoint(card.boundingBox, touchPoint)) {
            selectedCard = card;
            break;
        }
    }
    return YES;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    
    if(selectedCard) selectedCard.position = [self convertTouchToNodeSpace: touch];

}
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    if (selectedCard.position.y > winSize.height*.2) {
        [self cardPlayed:selectedCard];
    }
    [self organizeHand];
}

-(void)cardPlayed:(CardItem*)card{
    [[NSNotificationCenter defaultCenter] postNotificationName:kCardPlayed object:card];
    [handArray removeObject:card];
    [card removeFromParentAndCleanup:YES];
    selectedCard = nil;

}

-(void) registerWithTouchDispatcher
{
    [[CCDirector sharedDirector].touchDispatcher addTargetedDelegate:self priority:0 swallowsTouches:NO];
}

-(void) update:(ccTime) dt{

}

-(void)dealloc{
    [handArray release];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNotification_CardDrawLocal object:nil];
    [super dealloc];
}

@end
