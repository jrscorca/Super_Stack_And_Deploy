//
//  UIAbilityState.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/8/13.
//
//

#import "UIAbilityState.h"
#import "StatusVO.h"
@implementation UIAbilityState

@synthesize previousState, ability;

-(id)initWithState:(UIState *)_state andAbility:(Ability*) _ability{
    self.ability = _ability;
    self.previousState = _state;
    if(self = [super initWithState:_state]){


    }
    return self;
}

-(void)dealloc{
    [previousState release];
    [ability release];
    [super dealloc];
}

@end
