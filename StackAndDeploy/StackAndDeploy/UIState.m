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


#pragma mark - Camera Functionality

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
    [self checkCameraBounds];
}

-(void) checkCameraBounds{
    CGPoint pos = playLayer.boardLayer.position;
 //   NSLog(@"%f, %f", pos.x, pos.y);
    if(pos.x > 0){
        playLayer.boardLayer.position = ccp(0, playLayer.boardLayer.position.y);
    }
       if(pos.y > 0){
           playLayer.boardLayer.position = ccp(playLayer.boardLayer.position.x, 0);
       }
    
    //board limit
    CGSize limit = BOARD_SIZE;
    float widthLimit = -(limit.width - 480);
    float heightLimit = -(limit.height - 320);
    if(pos.x < widthLimit){
        playLayer.boardLayer.position = ccp(widthLimit, playLayer.boardLayer.position.y);
    }
    if(pos.y < heightLimit){
        playLayer.boardLayer.position = ccp(playLayer.boardLayer.position.x, heightLimit);
    }
}

-(void) cleanCameraVariables{
    cameraVelocity = CGPointZero;
    deltaTouch = CGPointZero;
    previousTouchPoint = CGPointZero;
}



#pragma mark - MiniMap


-(void) moveMiniMap:(UITouch*) touch withEvent:(UIEvent*) event{
    CGPoint touchPoint = [playLayer convertTouchToNodeSpace: touch];
    //    CGRect minimapRect = CGRectMake(0, 0, 100, 100);
//    if (CGRectContainsPoint(MINIMAP_RECT, touchPoint)) {
        // find percent spot touched on mini map
        CGPoint percentOnMiniMap = ccp(-touchPoint.x/MINIMAP_RECT.size.width, -touchPoint.y/MINIMAP_RECT.size.height);
        //TODO: this number should be a ratio between screen size and map size
        percentOnMiniMap = ccpSub(percentOnMiniMap, ccp(-0.2, -0.2));
        
        // move boardLayer to that relative spot
        CGSize limit = BOARD_SIZE;
        playLayer.boardLayer.position = ccp(percentOnMiniMap.x * limit.width, percentOnMiniMap.y * limit.height);
        
    
  //  }
}

#pragma mark - Transitions

//State Transitions
-(void) transitionToNormalState{
    NSLog(@"normal transtition");
}
-(void) transitionToShipSelectState{
    NSLog(@"ship select transition");
}

@end
