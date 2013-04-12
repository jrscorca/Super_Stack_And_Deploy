//
//  DetailsLayer.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/9/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "DetailsLayer.h"
#import "ShipSprite.h"
#import "GameObjectSprite.h"
#import "NodeSprite.h"
#import "ShipModel.h"
#import "NodeModel.h"
#import "Ability.h"


@implementation DetailsLayer



@synthesize healthLabel, nameLabel, ability;

-(id) init{
    if(self = [super init]){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(spriteSelected:) name:kNotification_SpriteSelected object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(abilitySelected:) name:kNotification_AbilitySelected object:nil];
        
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        self.healthLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"HP:%.0f", 10.0] fontName:@"helvetica" fontSize:14];
        healthLabel.position = ccp(winSize.width/2, 40);
        [self addChild:healthLabel];
        
        self.nameLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Wraith"] fontName:@"helvetica" fontSize:14];
        nameLabel.position = ccp(winSize.width/2, 54);
        [self addChild:nameLabel];
        
        
    }
    return self;
}

-(void) dealloc{
    //this removes all observers from this object
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [selectedSprite removeObjectFromPointer:&selectedSprite];
    [ability release];
    [super dealloc];
}

-(void) update:(ccTime)dt{
    [self updateInterface];
}

-(void)updateInterface{
    if(ability){
        [self updateAbilityInterface:self.ability];
    }else if([selectedSprite isKindOfClass:[ShipSprite class]]){
        [self updateShipInterface:(ShipSprite*)selectedSprite];
    }else if([selectedSprite isKindOfClass:[NodeSprite class]]){
        [self updateNodeInterface:(NodeSprite*)selectedSprite];
    }
}

-(void) abilitySelected:(NSNotification*) notification{
    self.ability = (Ability*)notification.object;
    [self setupAbilityInterface:ability];
}

-(void) spriteSelected:(NSNotification*) notification{
    //need to clear ability pointer
    self.ability = nil;
    GameObjectSprite *sprite = (GameObjectSprite*)notification.object;
    [sprite removeObjectFromPointer:&selectedSprite];
    [sprite assignObjectToPointer:&selectedSprite];
    
    if([sprite isKindOfClass:[ShipSprite class]]){
        [self setupShipInterface:(ShipSprite*)sprite];
    }else if([sprite isKindOfClass:[NodeSprite class]]){
        [self setupNodeInterface:(NodeSprite*)sprite];
    }
}

#pragma mark - setup interfaces

-(void) setupShipInterface:(ShipSprite*) ship{
    healthLabel.visible = YES;
    nameLabel.visible = YES;
}

-(void) setupNodeInterface:(NodeSprite*) node{
    healthLabel.visible = YES;
    nameLabel.visible = YES;
}

-(void) setupAbilityInterface:(Ability*) _ability{
    healthLabel.visible = YES;
    nameLabel.visible = YES;
}

#pragma mark - update interfaces
-(void) updateShipInterface:(ShipSprite*) ship{
    ShipModel *model = (ShipModel*)ship.model;
    [self.nameLabel setString:[NSString stringWithFormat:@"%@", model.name]];
    [self.healthLabel setString:[NSString stringWithFormat:@"%d/%d", model.health, model.maxHealth]];
}

-(void) updateNodeInterface:(NodeSprite*) node{
    NodeModel *model = (NodeModel*)node.model;
    [self.nameLabel setString:[NSString stringWithFormat:@"Resource Node"]];
    [self.healthLabel setString:[NSString stringWithFormat:@"resources: %.0f", model.resourcesLeft]];
}

-(void) updateAbilityInterface:(Ability*) _ability{
    [self.nameLabel setString:[NSString stringWithFormat:@"Target Ship"]];
    [self.healthLabel setString:[NSString stringWithFormat:@"target one ship"]];
}

@end
