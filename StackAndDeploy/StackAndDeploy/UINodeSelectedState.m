//
//  UINodeSelectedState.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/9/13.
//
//

#import "UINodeSelectedState.h"
#import "NodeLayer.h"
#import "NodeModel.h"
#import "NodeSprite.h"
#import "CardItem.h"
#import "ShipSprite.h"
#import "UIShipSelectState.h"
#import "UINormalState.h"
#import "PlayLayer.h"
#import "HUDLayer.h"
#import "ShipLayer.h"
#import "HandLayer.h"
#import "DetailsLayer.h"
#import "CommandLayer.h"

@implementation UINodeSelectedState

@synthesize selectedNode;


-(id) initWithSelectedNode:(NodeSprite*) _selectedNode andState:(UIState*) state{
    [_selectedNode assignObjectToPointer:&selectedNode];
    if(self = [super initWithState:state]){
    }
    return self;
}


-(void)dealloc{
    [selectedNode removeObjectFromPointer:&selectedNode];
    [super dealloc];
}

-(void)activateInterfaceElements{
    UIState.playLayer.hudLayer.detailsLayer.visible = YES;
    UIState.playLayer.hudLayer.commandLayer.visible = YES;
    self.selectedNode.isSelected = YES;
    //send notification
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_SpriteSelected object:selectedNode];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_ControlCommandButtons object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_ChangeCommandButtons object:selectedNode];
}

-(void)deactivateInterfaceElements{
    selectedNode.isSelected = NO;
    UIState.playLayer.hudLayer.detailsLayer.visible = NO;
    UIState.playLayer.hudLayer.commandLayer.visible = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_ControlCommandButtons object:nil];
}

-(void) updateState:(ccTime)dt{
    if(!selectedNode){
        [self transitionToNormalState];
        return;
    }
    
    [super updateState:dt];
}

-(void) commandExecuted:(NSNotification*) notification{
    CCMenuItemSprite *object = notification.object;
    NSLog(@"node menu: %d", object.tag);
    int commandNumber = object.tag;
    if(commandNumber == -1){
        return;
    }
    // 1: deselect
    if(commandNumber == 1){
        [self transitionToNormalState];
    }
}


- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    [self cameraOnTouchBegan:touch withEvent:event];
    CGPoint touchPoint = [UIState.playLayer convertTouchToNodeSpace: touch];
    if (CGRectContainsPoint(MINIMAP_RECT, touchPoint)) {
        isMiniMapSelected = YES;
        [self moveMiniMap: touch withEvent:event];
        [self cleanCameraVariables];
        return YES;
    }
    if([self commandTouchBegan:touch withEvent:event]) {
        return YES;
    }
    
    
    
    //    selectedShip
    
    GameObjectSprite *touchedObject = [self objectAtPoint:touch withEvent:event];
    if(touchedObject){
        if([touchedObject isKindOfClass:[CardItem class]]){
            NSLog(@"error: no card should exist here in UIShipSelectedState");
        }else if([touchedObject isKindOfClass:[ShipSprite class]]){
            [self transitionToShipSelectState:(ShipSprite*)touchedObject];
            return YES;
        }else if([touchedObject isKindOfClass:[NodeSprite class]]){
            //TODO: transition to node state
            
            return YES;
        }
    }
    
    nothingTouched = YES;
    return YES;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    
    if(isMiniMapSelected){
        [self moveMiniMap: touch withEvent:event];
    }else if(nothingTouched){
        screenMoved = YES;
        [self cameraOnTouchMoved:touch withEvent:event];
    }else{
        [self sideCameraMovement:touch withEvent:event];
    }
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    [self cameraOnTouchEnded:touch withEvent:event];
    //    CGPoint touchPoint = [UIState.playLayer convertTouchToNodeSpace: touch];
    
    //first if needs to be here
    if(isMiniMapSelected){
    }else if([self commandTouchEnded:touch withEvent:event]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_ControlCommandButtons object:nil];
        [self executeCommand:commandTouched];
        //do ability
    }else if(nothingTouched && !screenMoved){
        [self transitionToNormalState];
    }
    screenMoved = NO;
    nothingTouched = NO;
    isMiniMapSelected = NO;
    commandTouched = -1;
    
    moveCameraDown = NO;
    moveCameraLeft = NO;
    moveCameraRight = NO;
    moveCameraUp = NO;
    
    
}

- (void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event{
    isMiniMapSelected = NO;
    commandTouched = -1;
    moveCameraDown = NO;
    moveCameraLeft = NO;
    moveCameraRight = NO;
    moveCameraUp = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_ControlCommandButtons object:nil];
}



#pragma mark - Transitions

-(void) transitionToNormalState{
    [self deactivateInterfaceElements];
    UINormalState *normalState = [[[UINormalState alloc] initWithState:self] autorelease];
    [UIState.playLayer changeUIState:normalState];
}

-(void) transitionToShipSelectState:(ShipSprite *)ship{
    [self deactivateInterfaceElements];
    UIShipSelectState *shipSelectState = [[[UIShipSelectState alloc] initWithSelectedShip:ship andState:self] autorelease];
    [UIState.playLayer changeUIState:shipSelectState];
}

-(void) transitionToNodeSelectState:(NodeSprite*) node{
    [self deactivateInterfaceElements];
    UINodeSelectedState *nodeSelectState = [[[UINodeSelectedState alloc] initWithSelectedNode:node andState:self] autorelease];
    [UIState.playLayer changeUIState:nodeSelectState];
}

@end
