//
//  TargetShipAbility.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/12/13.
//
//

#import "Ability.h"

@interface TargetShipAbility : Ability{
    GameObjectSpriteArray *targetedShips;
    int shipsToTarget;
}

@property (nonatomic, retain) GameObjectSpriteArray *targetedShips;

@end
