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

-(id)initWithState:(UIState *)_state andStatuses:(NSArray*)_statuses{
    if(self = [super initWithState:_state]){
        statuses = [[NSArray alloc] initWithArray:_statuses];
    }
    return self;
}

-(void)dealloc{
    [statuses release];
    [super dealloc];
}

@end
