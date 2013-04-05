//
//  MatchDataManager.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import "MatchDataManager.h"
#import "PlayerClass.h"
#import "LocalPlayer.h"
#import "AwayPlayer.h"

@implementation MatchDataManager


@synthesize localPlayer, awayPlayer, cardItems, ships, boardSize, nodes, bases, boardItems, gameObjectSprites, bullets;

static MatchDataManager *sharedInstance = nil;


+ (MatchDataManager*)sharedInstance {
    @synchronized(self) {
		if (sharedInstance == nil)
			sharedInstance = [[[self class] alloc] init];
    }
    return sharedInstance;
}

-(id) init{
    if(self = [super init]){
        self.localPlayer = [[[LocalPlayer alloc] init] autorelease];
        self.awayPlayer = [[[AwayPlayer alloc] init] autorelease];
        self.cardItems = [GameObjectSpriteArray array];
        self.ships = [GameObjectSpriteArray array];
        self.boardItems = [GameObjectSpriteArray array];
        self.nodes = [GameObjectSpriteArray array];
        self.bases = [GameObjectSpriteArray array];
        self.gameObjectSprites = [GameObjectSpriteArray array];
        self.bullets = [GameObjectSpriteArray array];
        boardSize = CGSizeMake(1000,1000);
        
    }
    return self;
}

-(void) dealloc{
    [localPlayer release];
    [awayPlayer release];
    
    //these arrays are special and need all objects in them destroyed when they are destroyed
    [cardItems destroyObjectsInArray];
    [cardItems destroyArray];
    
    [gameObjectSprites destroyObjectsInArray];
    [gameObjectSprites destroyArray];
    
    [boardItems destroyObjectsInArray];
    [boardItems destroyArray];
    [nodes destroyObjectsInArray];
    [nodes destroyArray];
    [bases destroyObjectsInArray];
    [bases destroyArray];
    
    [ships destroyObjectsInArray];
    [ships destroyArray];
    
    [bases destroyObjectsInArray];
    [bases destroyArray];
    
    [bullets destroyObjectsInArray];
    [bullets destroyArray];
    
    [super dealloc];
}


-(PlayerClass*) getPlayer:(playerType) player{
    if(player == LOCAL_PLAYER){
        return localPlayer;
    }
    if(player == AWAY_PLAYER){
        return awayPlayer;
    }
    return nil;
}

@end
