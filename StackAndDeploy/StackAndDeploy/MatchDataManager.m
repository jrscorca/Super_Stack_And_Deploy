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


@synthesize localPlayer, awayPlayer, localCardItems, ships, boardSize, nodes, bases, boardItemSprites;

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
        self.localCardItems = [GameObjectSpriteArray array];
        self.ships = [GameObjectSpriteArray array];
        self.boardItemSprites = [GameObjectSpriteArray array];
        self.nodes = [GameObjectSpriteArray array];
        self.bases = [GameObjectSpriteArray array];
        boardSize = CGSizeMake(1000,1000);
        
    }
    return self;
}

-(void) dealloc{
    [localPlayer release];
    [awayPlayer release];
    
    //these arrays are special and need all objects in them destroyed when they are destroyed
    [localCardItemArray destroyObjectsInArray];
    [localCardItemArray destroyArray];
    [ships destroyObjectsInArray];
    [ships destroyArray];
    
    [super dealloc];
}

@end
