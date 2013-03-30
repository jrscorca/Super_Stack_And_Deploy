//
//  UIState.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/29/13.
//
//

#import "UIState.h"
#import "PlayLayer.h"
#import "UtilityFunctions.h"
#import "BoardLayer.h"


@implementation UIState

@synthesize playLayer;

-(id) initWithPlayLayer:(PlayLayer*) _playLayer{
    if(self = [super init]){
        self.playLayer = _playLayer;
        previousTouchPoint = ccp(0, 0);
        cameraVelocity = ccp(0,0);
        deltaTouch = ccp(0,0);
    }
    return self;
}

-(void) updateState:(ccTime) dt{
    [self updateCamera:dt];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    
    return YES;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    
    
}
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    
}

- (void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event{
    
}



//map movement functions
-(void) cameraOnTouchBegan:(UITouch*) touch withEvent:(UIEvent*) event{
    previousTouchPoint = [playLayer convertTouchToNodeSpace:touch];
}
-(void) cameraOnTouchMoved:(UITouch*) touch withEvent:(UIEvent*) event{
    CGPoint touchPoint = [playLayer convertTouchToNodeSpace:touch];
//  NSLog(@"pintPoint %f, %f", touchPoint.x, touchPoint.y);
    deltaTouch = ccpSub(touchPoint, previousTouchPoint);
    previousTouchPoint = touchPoint;
}

-(void) cameraOnTouchEnded:(UITouch*) touch withEvent:(UIEvent*) event{
    deltaTouch = CGPointZero;
}

-(void) cameraOnTouchCancelled:(UITouch*) touch withEvent:(UIEvent*) event{
    deltaTouch = CGPointZero;
}

- (void)updateCamera:(ccTime) dt {
    cameraVelocity = [UtilityFunctions truncate:cameraVelocity toMax:PAN_VELOCITY_MAX * dt];
    cameraVelocity = CGPointMake(cameraVelocity.x + PAN_VELOCITY_SPEED*(deltaTouch.x)*dt, cameraVelocity.y + PAN_VELOCITY_SPEED*(deltaTouch.y)*dt);
    cameraVelocity = ccpLerp(cameraVelocity, ccpMult(cameraVelocity, PAN_VELOCITY_FRICTION), dt);
//	cameraVelocity = CGPointMake(cameraVelocity.x * PAN_VELOCITY_FRICTION * dt, cameraVelocity.y * PAN_VELOCITY_FRICTION * dt);
	if(ccpLength(cameraVelocity)  < PAN_VELOCITY_MIN){
		cameraVelocity = CGPointMake(0.0, 0.0);
	}
    playLayer.boardLayer.position = ccp(playLayer.boardLayer.position.x + cameraVelocity.x, playLayer.boardLayer.position.y + cameraVelocity.y);
}


@end
