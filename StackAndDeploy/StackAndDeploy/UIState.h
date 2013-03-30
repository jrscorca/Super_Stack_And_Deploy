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
@interface UIState : NSObject{
    PlayLayer *playLayer;
    
    //user movement around the map
    CGPoint previousTouchPoint;
    CGPoint deltaTouch;
    CGPoint cameraVelocity;
}
@property (nonatomic, assign) PlayLayer *playLayer;

- (id) initWithPlayLayer:(PlayLayer*) _playLayer;

- (void) updateState:(ccTime) dt;
//camera stuff
//map movement functions
-(void) cameraOnTouchBegan:(UITouch*) touch withEvent:(UIEvent*) event;
-(void) cameraOnTouchMoved:(UITouch*) touch withEvent:(UIEvent*) event;
-(void) cameraOnTouchEnded:(UITouch*) touch withEvent:(UIEvent*) event;
-(void) cameraOnTouchCancelled:(UITouch*) touch withEvent:(UIEvent*) event;

- (void)updateCamera:(ccTime) dt;

- (BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event;
- (void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event;
- (void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event;
- (void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event;





@end
