//
//  UIStates.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/29/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"



@class PlayLayer;


@class ShipSprite, GameObjectSprite, CardItem;
@interface UIState : NSObject{

    
    //user movement around the map
    CGPoint previousTouchPoint;
    CGPoint deltaTouch;
    CGPoint cameraVelocity;
    
    //minimap
    BOOL isMiniMapSelected;
    
    
    int commandTouched;
    BOOL moveCameraUp;
    BOOL moveCameraDown;
    BOOL moveCameraLeft;
    BOOL moveCameraRight;
}

@property CGPoint previousTouchPoint, deltaTouch, cameraVelocity;
@property BOOL isMiniMapSelected;



// playLayer needs to be set at the start of each game and cleared at the end of each game
+ (void)setPlayLayer:(PlayLayer*) _playLayer;

+(PlayLayer*) playLayer;

- (id) initWithState:(UIState*) state;

- (void) updateState:(ccTime) dt;

-(GameObjectSprite*) objectAtPoint:(UITouch*) touch withEvent:(UIEvent*) event;

-(BOOL) commandTouchBegan:(UITouch*) touch withEvent:(UIEvent*) event;
-(BOOL) commandTouchEnded:(UITouch*) touch withEvent:(UIEvent*) event;
-(void) executeCommand:(int) commandNumber;
-(void) commandExecuted:(NSNotification*) notification;
//camera stuff
//map movement functions
-(void) cameraOnTouchBegan:(UITouch*) touch withEvent:(UIEvent*) event;
-(void) cameraOnTouchMoved:(UITouch*) touch withEvent:(UIEvent*) event;
-(void) cameraOnTouchEnded:(UITouch*) touch withEvent:(UIEvent*) event;
-(void) cameraOnTouchCancelled:(UITouch*) touch withEvent:(UIEvent*) event;
-(void) checkCameraBounds;

-(void) sideCameraMovement:(UITouch*) touch withEvent:(UIEvent*) event;
- (void)updateCamera:(ccTime) dt;
-(void) cleanCameraVariables;

- (BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event;
- (void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event;
- (void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event;
- (void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event;

//mini map stuff
-(CGPoint) miniMapToBoardConversion:(UITouch*)touch withEvent:(UIEvent*)event;
-(void) moveMiniMap:(UITouch*) touch withEvent:(UIEvent*) event;



//State Transitions
-(void) transitionToNormalState;
-(void) transitionToShipSelectState:(ShipSprite*) ship;
-(void) transitionToCardSelectState:(CardItem*) card;

@end
