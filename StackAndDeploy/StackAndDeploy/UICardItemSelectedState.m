//
//  UICardItemSelectedState.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/2/13.
//
//

#import "UICardItemSelectedState.h"
#import "CardItem.h"
#import "PlayLayer.h"
#import "HUDLayer.h"
#import "HandLayer.h"
#import "MatchDataManager.h"
#import "BoardLayer.h"
#import "ShipLayer.h"
#import "ShipSprite.h"
#import "DetailsLayer.h"
#import "UINormalState.h"
#import "UIAbilityTargetsSelectState.h"
#import "CardModel.h"
#import "Ability.h"

@implementation UICardItemSelectedState



-(id) initWithSelectedCardItem:(CardItem*) cardItem andState:(UIState*) state{
    [cardItem assignObjectToPointer:&selectedCard];
    if(self = [super initWithState:state]){

//        selectedCard.isSelected = YES;
        
    }
    return self;
}


-(void)dealloc{
    [selectedCard removeObjectFromPointer:&selectedCard];
    [super dealloc];
}




-(void)activateInterfaceElements{
    UIState.playLayer.hudLayer.handLayer.visible = YES;
}

-(void)deactivateInterfaceElements{
    UIState.playLayer.hudLayer.handLayer.visible = NO;
}

-(void) updateState:(ccTime)dt{
    if(!selectedCard){
        [self transitionToNormalState];
        return;
    }
    
    [super updateState:dt];
}


- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    
    
    //    selectedShip
    
  /*  GameObjectSprite *touchedObject = [self objectAtPoint:touch withEvent:event];
    if(touchedObject){
        if([touchedObject isKindOfClass:[CardItem class]]){
            [self transitionToCardSelectState:(CardItem*)touchedObject];
            return YES;
        }else if([touchedObject isKindOfClass:[Ship class]]){
//            NSLog(@"error: no sh should exist here in UICardSelectedState");
            [self transitionToShipSelectState:(Ship*)touchedObject];
            return YES;
        }
    }
    CGPoint touchPoint = [UIState.playLayer convertTouchToNodeSpace: touch];
    if (CGRectContainsPoint(MINIMAP_RECT, touchPoint)) {
        isMiniMapSelected = YES;
        [self moveMiniMap: touch withEvent:event];
        [self cleanCameraVariables];
        return YES;
    }
    
    
    [self transitionToNormalState];
   */
    NSLog(@"NOTHING SHOULD HAPPEN IN CARDITEMSELECTEDSTATE BEGIN");
    return YES;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    selectedCard.position = [UIState.playLayer.hudLayer.handLayer convertTouchToNodeSpace: touch];
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    if(selectedCard){
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        if (selectedCard.position.y > winSize.height*.2) {
            if(selectedCard.model.type == SHIP){
                [self cardPlayed:selectedCard];
            }else{
                if ([selectedCard.model.ability isAbilityActivatable:self]) {
                    [selectedCard.model.ability activateAbility:self];
                }

            }

            [selectedCard destroyObject];
        }else{
            [self transitionToNormalState];
        }
        
        //TODO: make notificaiton for this shitttt
        [UIState.playLayer.hudLayer.handLayer organizeHand];
    }
    
}

- (void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event{
    [self transitionToNormalState];
}


-(void)cardPlayed:(CardItem*)card{
    [[NSNotificationCenter defaultCenter] postNotificationName:kCardPlayed object:card];
}

#pragma mark - Transitions

-(void) transitionToNormalState{
    [self deactivateInterfaceElements];
    UINormalState *normalState = [[[UINormalState alloc] initWithState:self] autorelease];
    [UIState.playLayer changeUIState:normalState];
    
}

-(void) transitionToCardSelectState:(CardItem *)card{
    [self deactivateInterfaceElements];
    UICardItemSelectedState *cardItemSelectedState = [[[UICardItemSelectedState alloc] initWithSelectedCardItem:card andState:self] autorelease];
    [UIState.playLayer changeUIState:cardItemSelectedState];
}

-(void) transitionToAbilityTargetsSelectState:(Ability *)ability{
    [self deactivateInterfaceElements];
    UIAbilityTargetsSelectState *abilityTargetsSelectState = [[[UIAbilityTargetsSelectState alloc] initWithState:self andAbility:ability] autorelease];
    [UIState.playLayer changeUIState:abilityTargetsSelectState];
}




@end
