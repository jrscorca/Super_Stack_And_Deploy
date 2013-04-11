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
    if(self = [super initWithState:_state]){
        self.previousState = _state;
        self.ability = _ability;
    }
    return self;
}

-(void)dealloc{
    [previousState release];
    [ability release];
    [super dealloc];
}

@end
