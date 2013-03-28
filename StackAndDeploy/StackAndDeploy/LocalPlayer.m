//
//  LocalPlayer.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import "LocalPlayer.h"

@implementation LocalPlayer



-(void)drawCardFromDeck{
    [self.library drawCardFromDeck:kNotification_CardDrawLocal];
}


@end
