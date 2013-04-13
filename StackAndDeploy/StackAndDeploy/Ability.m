//
//  Ability.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/4/13.
//
//

#import "Ability.h"

@implementation Ability

@synthesize selectedCommandImage, normalCommandImage, disabledCommandImage, statuses, isTargetRequired;

-(id) initWithAbilityVO:(AbilityVO*) _abilityVO{
    if(self = [super init]){
        self.selectedCommandImage = @"Command_Pressed.png";
        self.normalCommandImage = @"Command.png";
        self.disabledCommandImage = @"Command_Pressed.png";
        self.statuses = [NSMutableArray array];
    }
    return self;
}

-(void)dealloc{
    [statuses release];
    [selectedCommandImage release];
    [normalCommandImage release];
    [disabledCommandImage release];
    [super dealloc];
}

@end
