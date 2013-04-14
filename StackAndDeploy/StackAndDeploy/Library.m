//
//  Library.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import "Library.h"
#import "CardVO.h"
#import "JSON.h"



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
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cards" ofType:@"json"];
    if (filePath) {
        NSError *error = nil;
        NSString *myText = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
        if(error){
            NSLog(@"ERROR: Tip library could not be parsed");
        }

    
    SBJSON *parser = [[[SBJSON alloc] init] autorelease];
	NSDictionary *resultDic = [parser objectWithString:myText error:nil];
        NSArray *cards = [resultDic objectForKey:@"cards"];
        for(NSDictionary *cardsDic in cards){
            CardVO *card = [[[CardVO alloc] initWithDictionary:cardsDic] autorelease];
            [deck addObject:card];
        }
    }
}

-(void) drawCardFromDeck: (NSString*) notificationName{
    //TODO, do length check and end game if no cards exist in deck
    if (self.deck.count >0) {
        
    CardVO *card = [self.deck objectAtIndex:0];
    [self.hand addObject:card];
    [self.deck removeObject:card];
    //NSNotification
    [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:card];
    }
}

@end
