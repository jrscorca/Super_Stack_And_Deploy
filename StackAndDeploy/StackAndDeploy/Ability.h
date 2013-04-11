//
//  Ability.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/4/13.
//
//

#import <Foundation/Foundation.h>

@class ShipSprite, UIState, BoardLayer, UIShipSelectState;
@interface Ability : NSObject{
    
    NSString *normalCommandImage, *selectedCommandImage, *disabledCommandImage;
}

@property (nonatomic, retain) NSString *normalCommandImage, *selectedCommandImage, *disabledCommandImage;

-(id) init;


//initial call when ability is used
-(void) activateAbility:(UIState*) state;

-(void) activateShipAbility:(UIShipSelectState*) state;

//targets objects to use ability on
-(void) targetObject:(BoardLayer*) boardLayer withTouch:(UITouch*) touch;

// checks whether the ability can be used
-(BOOL) isAbilityReady;

//does what the ability should do
-(void) useAbility;

@end
