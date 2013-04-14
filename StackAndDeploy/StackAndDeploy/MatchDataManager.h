//
//  MatchDataManager.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import <Foundation/Foundation.h>

@class PlayerClass, LocalPlayer, AwayPlayer, PlayLayer;
@interface MatchDataManager : NSObject{
    LocalPlayer *localPlayer;
    AwayPlayer *awayPlayer;
    
    CGSize boardSize;
    
    GameObjectSpriteArray *gameObjectSprites;
    
    PlayLayer             *playLayer;
    GameObjectSpriteArray *cardItems;
    GameObjectSpriteArray *boardItems;
    GameObjectSpriteArray *bullets;
    GameObjectSpriteArray *ships;
    GameObjectSpriteArray *nodes;
    GameObjectSpriteArray *bases;
    GameObjectSpriteArray *gameObjectsToRemove;
    
}

@property (nonatomic, assign) PlayLayer *playLayer;
@property (assign) CGSize boardSize;
@property (nonatomic, retain) LocalPlayer *localPlayer;
@property (nonatomic, retain) AwayPlayer *awayPlayer;
@property (nonatomic, retain) GameObjectSpriteArray *cardItems, *ships, *boardItems, *nodes, *bases, *gameObjectSprites, *bullets,*gameObjectsToRemove;


+ (MatchDataManager*)sharedInstance;

-(PlayerClass*) getPlayer:(playerType) player;
-(void)cleanupGameObjects;

@end
