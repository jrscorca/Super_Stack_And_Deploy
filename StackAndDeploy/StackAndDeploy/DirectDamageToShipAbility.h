//
//  DirectDamageToShipAbility.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/11/13.
//
//

#import "Ability.h"

@interface DirectDamageToShipAbility : Ability{
    GameObjectSpriteArray *targetedShips;
}

@property (nonatomic, retain) GameObjectSpriteArray *targetedShips;



@end
