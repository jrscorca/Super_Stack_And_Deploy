//
//  AwayPlayer.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import "AwayPlayer.h"

@implementation AwayPlayer



-(void)drawCardFromDeck{
    [self.library drawCardFromDeck:kNotification_CardDrawAway];
}

@end
