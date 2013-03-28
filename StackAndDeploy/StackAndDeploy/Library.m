//
//  Library.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import "Library.h"
#import "CardVO.h"



@implementation Library

@synthesize hand, deck, discardPile;


-(id) init{
    if(self = [super init]){
        self.hand = [NSMutableArray array];
        self.deck = [NSMutableArray array];
        self.discardPile = [NSMutableArray array];
        [self fillDeck];
    }
    return self;
}


-(void) dealloc{
    [hand release];
    [deck release];
    [discardPile release];
    [super dealloc];
}


-(void) fillDeck{
    for(int i = 0; i < 20; i++){
        CardVO* card = [[[CardVO alloc] init] autorelease];
        [deck addObject:card];
    }
}

-(void) drawCardFromDeck: (NSString*) notificationName{
    //TODO, do length check and end game if no cards exist in deck
    CardVO *card = [self.deck objectAtIndex:0];
    [self.hand addObject:card];
    [self.deck removeObject:card];
    //NSNotification
    [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:card];
}

@end
