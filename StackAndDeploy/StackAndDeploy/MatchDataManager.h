//
//  MatchDataManager.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import <Foundation/Foundation.h>

@class PlayerClass, LocalPlayer, AwayPlayer;
@interface MatchDataManager : NSObject{
    LocalPlayer *localPlayer;
    AwayPlayer *awayPlayer;
    
    CGSize boardSize;
    
    GameObjectSpriteArray *gameObjectSprites;
    
    GameObjectSpriteArray *cardItems;
    GameObjectSpriteArray *boardItems;
    GameObjectSpriteArray *bullets;
    GameObjectSpriteArray *ships;
    GameObjectSpriteArray *nodes;
    GameObjectSpriteArray *bases;
    
}
@property (assign) CGSize boardSize;
@property (nonatomic, retain) LocalPlayer *localPlayer;
@property (nonatomic, retain) AwayPlayer *awayPlayer;
@property (nonatomic, retain) GameObjectSpriteArray *cardItems, *ships, *boardItems, *nodes, *bases, *gameObjectSprites, *bullets;


+ (MatchDataManager*)sharedInstance;

-(PlayerClass*) getPlayer:(playerType) player;

@end
