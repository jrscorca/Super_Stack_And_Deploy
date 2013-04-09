//
//  UIAbilityState.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/8/13.
//
//

#import "UIState.h"

@interface UIAbilityState : UIState{
    NSArray *statuses;
}

-(id)initWithState:(UIState *)_state andStatuses:(NSArray*)_statuses;

@end
