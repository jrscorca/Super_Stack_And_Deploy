//
//  CommandLayer.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "CommandLayer.h"
#import "GameObjectSprite.h"
#import "ShipSprite.h"
#import "ShipModel.h"
#import "NodeModel.h"
#import "NodeSprite.h"
#import "Ability.h"

@implementation CommandLayer


-(id) init{
    if(self = [super init]){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enableButton:) name:kNotification_ControlCommandButtons object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeCommands:) name:kNotification_ChangeCommandButtons object:nil];
        
        
        //        CGSize winSize = [[CCDirector sharedDirector] winSize];
    //    CCSprite *hud = [CCSprite spriteWithFile:@"abilities.png"];
  //      hud.position = ccp(425, 47);
//        [self addChild:hud];
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        CCSprite *idle0 = [CCSprite spriteWithFile:@"Command.png"];
        CCSprite *pressed0 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
        CCSprite *disabled0 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
        commandItem0 = [CCMenuItemSprite itemWithNormalSprite:idle0 selectedSprite:pressed0 disabledSprite:disabled0 target:self selector:@selector(commandPressed:)];
        commandItem0.tag = 0;
        commandItem0.position = ccp(372, 47);

        CCSprite *idle1 = [CCSprite spriteWithFile:@"Command.png"];
        CCSprite *pressed1 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
        CCSprite *disabled1 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
        commandItem1 = [CCMenuItemSprite itemWithNormalSprite:idle1 selectedSprite:pressed1 disabledSprite:disabled1 target:self selector:@selector(commandPressed:)];
        commandItem1.tag = 1;
        commandItem1.position = ccp(425, 47);
        
        CCSprite *idle2 = [CCSprite spriteWithFile:@"Command.png"];
        CCSprite *pressed2 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
        CCSprite *disabled2 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
        commandItem2 = [CCMenuItemSprite itemWithNormalSprite:idle2 selectedSprite:pressed2 disabledSprite:disabled2 target:self selector:@selector(commandPressed:)];
        commandItem2.tag = 2;
        commandItem2.position = ccp(372, 6);
        
        CCSprite *idle3 = [CCSprite spriteWithFile:@"Command.png"];
        CCSprite *pressed3 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
        CCSprite *disabled3 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
        commandItem3 = [CCMenuItemSprite itemWithNormalSprite:idle3 selectedSprite:pressed3  disabledSprite:disabled3 target:self selector:@selector(commandPressed:)];
        commandItem3.tag = 3;
        commandItem3.position = ccp(425, 6);
        
        

        commandMenu = [CCMenu menuWithItems:commandItem0, commandItem1, commandItem2, commandItem3,  nil];
        commandMenu.position = ccp(20, 15);
        [self addChild:commandMenu];
        
    }
    return self;
}

-(void) dealloc{
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNotification_CardDrawLocal object:nil];
    
    //this removes all observers from this object
    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    [selectedShip removeObjectFromPointer:&selectedShip];
    [super dealloc];
}

-(void) commandPressed:(id)sender{
    // Get a reference to the button that was tapped
    CCMenuItemFont *button = (CCMenuItemFont *)sender;
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_CommandPressed object:button];
}

-(void) enableButton:(NSNotification*) notification{
    for(CCMenuItemSprite *item in [commandMenu children]){
        [item setIsEnabled:YES];
    }
}

-(void)changeCommands:(NSNotification*) notification{
    GameObjectSprite *sprite = (GameObjectSprite*)notification.object;
    
    Class spriteClass = [sprite class];

    if(spriteClass == [ShipSprite class]){
        [self shipCommands:(ShipSprite*)sprite];
    }else if(spriteClass == [NodeSprite class]){
        [self nodeCommands:(NodeSprite*)sprite];
    }
    
}



-(void) update:(ccTime)dt{


}

#pragma mark - Command Interface Changes

-(void) shipCommands:(ShipSprite*)ship{
    ShipModel *model = (ShipModel*)ship.model;
    
    //move command
    commandItem0.visible = YES;
    commandItem0.isEnabled = YES;
    CCSprite *idle0 = [CCSprite spriteWithFile:@"Command.png"];
    CCSprite *pressed0 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
    CCSprite *disabled0 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
    commandItem0.selectedImage = pressed0;
    commandItem0.disabledImage = disabled0;
    commandItem0.normalImage   = idle0;
    
    //cancel command
    commandItem1.visible = YES;
    commandItem1.isEnabled = YES;
    CCSprite *idle1 = [CCSprite spriteWithFile:@"Command.png"];
    CCSprite *pressed1 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
    CCSprite *disabled1 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
    commandItem1.selectedImage = pressed1;
    commandItem1.disabledImage = disabled1;
    commandItem1.normalImage   = idle1;
    
    //abilties
    NSMutableArray *abilities = model.abilityArray;
    if([abilities count] > 0){
        Ability *ability = [abilities objectAtIndex:0];
        CCSprite *normal = [CCSprite spriteWithFile:ability.normalCommandImage];
        CCSprite *selected = [CCSprite spriteWithFile:ability.selectedCommandImage];
        CCSprite *disabled = [CCSprite spriteWithFile:ability.disabledCommandImage];
        commandItem2.normalImage   = normal;
        commandItem2.selectedImage = selected;
        commandItem2.disabledImage = disabled;
        commandItem2.visible = YES;
        commandItem2.isEnabled = YES;
    }else{
        commandItem2.visible = NO;
        commandItem2.isEnabled = NO;
    }
    
    if([abilities count] > 1){
        Ability *ability = [abilities objectAtIndex:1];
        CCSprite *normal = [CCSprite spriteWithFile:ability.normalCommandImage];
        CCSprite *selected = [CCSprite spriteWithFile:ability.selectedCommandImage];
        CCSprite *disabled = [CCSprite spriteWithFile:ability.disabledCommandImage];
        commandItem3.normalImage   = normal;
        commandItem3.selectedImage = selected;
        commandItem3.disabledImage = disabled;
        commandItem3.visible = YES;
        commandItem3.isEnabled = YES;
    }else{
        commandItem3.visible = NO;
        commandItem3.isEnabled = NO;
    }
    
}

-(void) nodeCommands:(NodeSprite*) node{
    NodeModel *model = (NodeModel*)node.model;

    commandItem0.visible = NO;
    commandItem0.isEnabled = NO;
    commandItem2.visible = NO;
    commandItem2.isEnabled = NO;
    commandItem3.visible = NO;
    commandItem3.isEnabled = NO;
    
    
    //cancel command
    commandItem1.visible = YES;
    commandItem1.isEnabled = YES;
    CCSprite *idle1 = [CCSprite spriteWithFile:@"Command.png"];
    CCSprite *pressed1 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
    CCSprite *disabled1 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
    commandItem1.selectedImage = pressed1;
    commandItem1.disabledImage = disabled1;
    commandItem1.normalImage   = idle1;
    
}



@end
