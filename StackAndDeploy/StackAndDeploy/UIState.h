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


@class Ship, GameObjectSprite, CardItem;
@interface UIState : NSObject{

    
    //user movement around the map
    CGPoint previousTouchPoint;
    CGPoint deltaTouch;
    CGPoint cameraVelocity;
    
    //minimap
    BOOL isMiniMapSelected;
    
}


// playLayer needs to be set at the start of each game and cleared at the end of each game
+ (void)setPlayLayer:(PlayLayer*) _playLayer;

+(PlayLayer*) playLayer;

- (id) init;

- (void) updateState:(ccTime) dt;

-(GameObjectSprite*) objectAtPoint:(UITouch*) touch withEvent:(UIEvent*) event;
//camera stuff
//map movement functions
-(void) cameraOnTouchBegan:(UITouch*) touch withEvent:(UIEvent*) event;
-(void) cameraOnTouchMoved:(UITouch*) touch withEvent:(UIEvent*) event;
-(void) cameraOnTouchEnded:(UITouch*) touch withEvent:(UIEvent*) event;
-(void) cameraOnTouchCancelled:(UITouch*) touch withEvent:(UIEvent*) event;
-(void) checkCameraBounds;

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
-(void) transitionToShipSelectState:(Ship*) ship;
-(void) transitionToCardSelectState:(CardItem*) card;

@end
