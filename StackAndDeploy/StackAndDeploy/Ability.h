//
//  Ability.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/4/13.
//
//

#import <Foundation/Foundation.h>

@class ShipSprite, UIState, BoardLayer, UIShipSelectState, AbilityVO;
@interface Ability : NSObject{
    
    NSString *normalCommandImage, *selectedCommandImage, *disabledCommandImage;
    BOOL isTargetRequired;
    //array of statusVOs
    NSMutableArray *statuses;
}

@property (nonatomic, retain) NSMutableArray *statuses;
@property (nonatomic) BOOL isTargetRequired;
@property (nonatomic, retain) NSString *normalCommandImage, *selectedCommandImage, *disabledCommandImage;

-(id) initWithAbilityVO:(AbilityVO*) _abilityVO;


//checks whether the ability can be activated
-(BOOL) isAbilityActivatable:(UIState*) state;

//initial call when ability is used
-(void) activateAbility:(UIState*) state;


//targets objects to use ability on
-(void) targetObject:(BoardLayer*) boardLayer withTouch:(UITouch*) touch;

// checks whether the ability can be used
-(BOOL) isAbilityReady;

//does what the ability should do
-(void) useAbility;

@end
