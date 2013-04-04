//
//  Ability.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/4/13.
//
//

#import <Foundation/Foundation.h>

@class ShipSprite;
@interface Ability : NSObject{
    ShipSprite *abilityOf;
}


-(id) initWithShip:(ShipSprite*) ship;

-(void) activateAbility;

@end
