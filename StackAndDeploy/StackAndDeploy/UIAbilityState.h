//
//  UIAbilityState.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/8/13.
//
//

#import "UIState.h"

@class Ability;
@interface UIAbilityState : UIState{
    UIState *previousState;
    Ability *ability;
}

@property (nonatomic, retain) Ability *ability;
@property (nonatomic, retain) UIState *previousState;

-(id)initWithState:(UIState *)_state andAbility:(Ability*) _ability;

@end
