//
//  PositionAbility.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/13/13.
//
//

#import "Ability.h"

@interface PositionAbility : Ability{
    CGPoint targetPosition;
}

@property (nonatomic, assign) CGPoint targetPosition;

-(id) initWithAbilityVO:(AbilityVO*) _abilityVO;

@end
