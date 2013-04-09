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
    
    NSString *normalCommandImage, *selectedCommandImage, *disabledCommandImage;
}

@property (nonatomic, retain) NSString *normalCommandImage, *selectedCommandImage, *disabledCommandImage;

-(id) initWithShip:(ShipSprite*) ship;

-(void) activateAbility;

@end
