//
//  UIAbilityTargetsSelectState.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/8/13.
//
//

#import "UIAbilityState.h"
@class Ownership;
@interface UIAbilityTargetsSelectState : UIAbilityState{
    NSMutableArray *targets;
    BOOL nothingTouched;
    boardItemType *_boardItemType;
    int targetNumber;
    Ownership* ownership;
    Class targetClass;
    int targetsSoFar;
}

-(id)initWithState:(UIState *)_state
       andStatuses:(NSArray *)_statuses
    andTargetTypes:(boardItemType)type
   andTargetNumber:(int)_targetNumber;

@end
