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
#import "ShipSprite.h"
#import "HUDLayer.h"
#import "CardItem.h"
#import "MatchDataManager.h"


@implementation UIState

@synthesize deltaTouch, cameraVelocity, previousTouchPoint, isMiniMapSelected;

static PlayLayer *playLayer;

+ (void)setPlayLayer:(PlayLayer*) _playLayer{
    playLayer = _playLayer;
}

+(PlayLayer*) playLayer{
    return playLayer;
}

- (id) initWithState:(UIState*) state{
    if(self = [super init]){
//        self.playLayer = _playLayer;
        if(state){
            previousTouchPoint = state.previousTouchPoint;
            cameraVelocity = state.cameraVelocity;
            deltaTouch = state.deltaTouch;
            isMiniMapSelected = state.isMiniMapSelected;
        }else{
            previousTouchPoint = ccp(0, 0);
            cameraVelocity = ccp(0,0);
            deltaTouch = ccp(0,0);
        }
    }
    return self;
}

-(void) updateState:(ccTime) dt{
    [self updateCamera:dt];
}

-(GameObjectSprite*) objectAtPoint:(UITouch*) touch withEvent:(UIEvent*) event{
    //card movement
    CGPoint touchPoint = [playLayer.hudLayer.handLayer convertTouchToNodeSpace: touch];
    for (CardItem *card in MDM.cardItems){
        if(card.visible){
            if (CGRectContainsPoint(card.boundingBox, touchPoint)) {
                return card;
            }
        }
    }
    
    //ship movement
    touchPoint = [playLayer.boardLayer.shipLayer convertTouchToNodeSpace:touch];
    for (ShipSprite *ship in MDM.ships){
        if (CGRectContainsPoint(ship.boundingBox, touchPoint)) {
            return ship;
        }
    }
    return nil;
    
}

#pragma mark - touch events

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
//    cameraVelocity = CGPointZero;
}

-(void) cameraOnTouchMoved:(UITouch*) touch withEvent:(UIEvent*) event{
    CGPoint touchPoint = [playLayer convertTouchToNodeSpace:touch];
//  NSLog(@"pintPoint %f, %f", touchPoint.x, touchPoint.y);
    deltaTouch = ccpSub(touchPoint, previousTouchPoint);
    previousTouchPoint = touchPoint;
   // playLayer.boardLayer.position = ccpAdd(UIState.playLayer.boardLayer.position, deltaTouch);
    [self checkCameraBounds];
}

-(void) cameraOnTouchEnded:(UITouch*) touch withEvent:(UIEvent*) event{
    deltaTouch = CGPointZero;
}

-(void) cameraOnTouchCancelled:(UITouch*) touch withEvent:(UIEvent*) event{
    deltaTouch = CGPointZero;
}

-(void)updateCamera:(ccTime) dt{
    cameraVelocity = [UtilityFunctions truncate:cameraVelocity toMax:PAN_VELOCITY_MAX * dt];
    cameraVelocity = CGPointMake(cameraVelocity.x + PAN_VELOCITY_SPEED*(deltaTouch.x)*dt, cameraVelocity.y + PAN_VELOCITY_SPEED*(deltaTouch.y)*dt);
    CGPoint newCameraVel = ccp(cameraVelocity.x * PAN_VELOCITY_FRICTION, cameraVelocity.y * PAN_VELOCITY_FRICTION);
    CGPoint cameraDif = ccpSub(cameraVelocity, newCameraVel);
    cameraDif = ccpMult(cameraDif, dt * 15);
  //  NSLog(@"cameraVel %f, %f", cameraVelocity.x, cameraVelocity.y);
  //  NSLog(@"CameraDif %f, %f", cameraDif.x, cameraDif.y);
    cameraVelocity = ccpSub(cameraVelocity, cameraDif);
    
	if(ccpLength(cameraVelocity) * dt  < PAN_VELOCITY_MIN * dt){
		cameraVelocity = CGPointMake(0.0, 0.0);
	}
    playLayer.boardLayer.position = ccp(playLayer.boardLayer.position.x + cameraVelocity.x, playLayer.boardLayer.position.y + cameraVelocity.y);
     
//    playLayer.boardLayer.position =;
    [self checkCameraBounds];
}

-(void) checkCameraBounds{
    CGPoint pos = playLayer.boardLayer.position;
 //   NSLog(@"%f, %f", pos.x, pos.y);
    if(pos.x > 0){
        playLayer.boardLayer.position = ccp(0, playLayer.boardLayer.position.y);
        cameraVelocity = ccp(0, cameraVelocity.y);
    }
       if(pos.y > 180){
           playLayer.boardLayer.position = ccp(playLayer.boardLayer.position.x, 180);
           cameraVelocity = ccp(cameraVelocity.x, 180);
       }
    
    //board limit
    CGSize limit = MDM.boardSize;
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    float widthLimit = -(limit.width - winSize.width);
    float heightLimit = -(limit.height - winSize.height);
    if(pos.x < widthLimit){
        playLayer.boardLayer.position = ccp(widthLimit, playLayer.boardLayer.position.y);
        cameraVelocity = ccp(0, cameraVelocity.y);
    }
    if(pos.y < heightLimit){
        playLayer.boardLayer.position = ccp(playLayer.boardLayer.position.x, heightLimit);
        cameraVelocity = ccp(cameraVelocity.x, 0);
    }
}

-(void) cleanCameraVariables{
    cameraVelocity = CGPointZero;
    deltaTouch = CGPointZero;
    previousTouchPoint = CGPointZero;
}



#pragma mark - MiniMap

-(CGPoint) miniMapToBoardConversion:(UITouch*)touch withEvent:(UIEvent*)event{
    CGPoint touchPoint = [UIState.playLayer convertTouchToNodeSpace: touch];
    CGPoint percentOnMiniMap = ccp(touchPoint.x/MINIMAP_RECT.size.width, touchPoint.y/MINIMAP_RECT.size.height);
    
    // move boardLayer to that relative spot
    CGSize limit = MDM.boardSize;
    return ccp(percentOnMiniMap.x * limit.width, percentOnMiniMap.y * limit.height);
}

-(void) moveMiniMap:(UITouch*) touch withEvent:(UIEvent*) event{
    CGPoint touchPoint = [playLayer convertTouchToNodeSpace: touch];
    //    CGRect minimapRect = CGRectMake(0, 0, 100, 100);
//    if (CGRectContainsPoint(MINIMAP_RECT, touchPoint)) {
        // find percent spot touched on mini map
        CGPoint percentOnMiniMap = ccp(-touchPoint.x/MINIMAP_RECT.size.width, -touchPoint.y/MINIMAP_RECT.size.height);
        //TODO: this number should be a ratio between screen size and map size
        percentOnMiniMap = ccpSub(percentOnMiniMap, ccp(-0.2, -0.2));
        
        // move boardLayer to that relative spot
        CGSize limit = MDM.boardSize;
        playLayer.boardLayer.position = ccp(percentOnMiniMap.x * limit.width, percentOnMiniMap.y * limit.height);
        
    
  //  }
}

#pragma mark - Transitions

//State Transitions
-(void) transitionToNormalState{
    NSLog(@"normal transtition");
}
-(void) transitionToShipSelectState:(ShipSprite*) ship{
    NSLog(@"ship select transition");
}

-(void) transitionToCardSelectState:(CardItem*) card{
    NSLog(@"card select transition");    
}

@end
