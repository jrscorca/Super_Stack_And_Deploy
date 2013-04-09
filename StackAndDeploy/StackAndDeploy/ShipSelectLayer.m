//
//  ShipSelectLayer.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/31/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ShipSelectLayer.h"
#import "MatchDataManager.h"
#import "ShipSprite.h"
#import "ShipModel.h"

@implementation ShipSelectLayer

@synthesize healthLabel, shipNameLabel;

-(id) init{
    if(self = [super init]){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shipSelected:) name:kNotification_ShipSelected object:nil];
//        CGSize winSize = [[CCDirector sharedDirector] winSize];
/*        CCSprite *hud = [CCSprite spriteWithFile:@"abilities.png"];
        hud.position = ccp(425, 47);
        [self addChild:hud];
        */
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        self.healthLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"HP:%.0f", 10.0] fontName:@"helvetica" fontSize:14];
        healthLabel.position = ccp(winSize.width/2, 40);
        [self addChild:healthLabel];
        
        self.shipNameLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Wraith"] fontName:@"helvetica" fontSize:14];
        shipNameLabel.position = ccp(winSize.width/2, 54);
        [self addChild:shipNameLabel];
        
        
    }
    return self;
}

-(void) dealloc{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNotification_CardDrawLocal object:nil];
    
    //this removes all observers from this object
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [selectedShip removeObjectFromPointer:&selectedShip];
    [super dealloc];
}

-(void) update:(ccTime)dt{
    [self updateInterface];
    //board limit
/*  CGSize limit = MDM.boardSize;
    float widthLimit = -limit.width;
    float heightLimit = -limit.height;
    CGPoint pos = boardLayer.position;
    //find percent
    viewRect = ccp((pos.x/widthLimit) * MINIMAP_RECT.size.width, (pos.y/heightLimit) * MINIMAP_RECT.size.height);
    */
}

-(void)updateInterface{
    if(selectedShip){
        [self.shipNameLabel setString:[NSString stringWithFormat:@"%@", selectedShip.model.name]];
        [self.healthLabel setString:[NSString stringWithFormat:@"%d/%d", selectedShip.model.health, selectedShip.model.maxHealth]];
    }
}


-(void) shipSelected:(NSNotification*) notification{
    ShipSprite *ship = notification.object;
    [ship assignObjectToPointer:&selectedShip];
    
}



@end
