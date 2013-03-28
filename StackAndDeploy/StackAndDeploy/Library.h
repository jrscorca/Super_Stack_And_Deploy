//
//  Library.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import <Foundation/Foundation.h>

@interface Library : NSObject{
    NSMutableArray *deck, *hand, *discardPile;
    
}

@property (nonatomic, retain) NSMutableArray *deck, *hand, *discardPile;


-(void) fillDeck;

-(void) drawCardFromDeck: (NSString*) notificationName;

@end
