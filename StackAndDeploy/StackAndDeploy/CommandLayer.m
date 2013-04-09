//
//  CommandLayer.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "CommandLayer.h"


@implementation CommandLayer


-(id) init{
    if(self = [super init]){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enableButton:) name:kNotification_ControlCommandButtons object:nil];
        //        CGSize winSize = [[CCDirector sharedDirector] winSize];
    //    CCSprite *hud = [CCSprite spriteWithFile:@"abilities.png"];
  //      hud.position = ccp(425, 47);
//        [self addChild:hud];
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        CCSprite *idle0 = [CCSprite spriteWithFile:@"Command.png"];
        CCSprite *pressed0 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
        CCSprite *disabled0 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
        CCMenuItemSprite *item0 = [CCMenuItemSprite itemWithNormalSprite:idle0 selectedSprite:pressed0 disabledSprite:disabled0 target:self selector:@selector(commandPressed:)];
        item0.tag = 0;
        item0.position = ccp(372, 47);

        CCSprite *idle1 = [CCSprite spriteWithFile:@"Command.png"];
        CCSprite *pressed1 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
        CCSprite *disabled1 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
        CCMenuItemSprite *item1 = [CCMenuItemSprite itemWithNormalSprite:idle1 selectedSprite:pressed1 disabledSprite:disabled1 target:self selector:@selector(commandPressed:)];
        item1.tag = 1;
        item1.position = ccp(425, 47);
        
        CCSprite *idle2 = [CCSprite spriteWithFile:@"Command.png"];
        CCSprite *pressed2 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
        CCSprite *disabled2 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
        CCMenuItemSprite *item2 = [CCMenuItemSprite itemWithNormalSprite:idle2 selectedSprite:pressed2 disabledSprite:disabled2 target:self selector:@selector(commandPressed:)];
        item2.tag = 2;
        item2.position = ccp(372, 6);
        
        CCSprite *idle3 = [CCSprite spriteWithFile:@"Command.png"];
        CCSprite *pressed3 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
        CCSprite *disabled3 = [CCSprite spriteWithFile:@"Command_Pressed.png"];
        CCMenuItemSprite *item3 = [CCMenuItemSprite itemWithNormalSprite:idle3 selectedSprite:pressed3  disabledSprite:disabled3 target:self selector:@selector(commandPressed:)];
        item3.tag = 3;
        item3.position = ccp(425, 6);
        
        
        
        
        commandMenu = [CCMenu menuWithItems:item0, item1, item2, item3,  nil];
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
    NSLog(@"pressed");
    
}

-(void) enableButton:(NSNotification*) notification{
    for(CCMenuItemSprite *item in [commandMenu children]){
        [item setIsEnabled:YES];
    }

    NSLog(@"enableButtons");
}

-(void) update:(ccTime)dt{
//    [self updateInterface];
    //board limit
    /*  CGSize limit = MDM.boardSize;
     float widthLimit = -limit.width;
     float heightLimit = -limit.height;
     CGPoint pos = boardLayer.position;
     //find percent
     viewRect = ccp((pos.x/widthLimit) * MINIMAP_RECT.size.width, (pos.y/heightLimit) * MINIMAP_RECT.size.height);
     */
}

@end
