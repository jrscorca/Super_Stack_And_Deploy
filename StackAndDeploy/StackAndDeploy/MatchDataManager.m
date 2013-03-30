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

@synthesize localPlayer, awayPlayer, localCardItemArray, shipsArray;

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
        self.localCardItemArray = [GameObjectArray array];
        self.shipsArray = [GameObjectArray array];
        
    }
    return self;
}

-(void) dealloc{
    [localPlayer release];
    [awayPlayer release];
    
    //these arrays are special and need all objects in them destroyed when they are destroyed
    [localCardItemArray destroyObjectsInArray];
    [localCardItemArray destroyArray];
    [shipsArray destroyObjectsInArray];
    [shipsArray destroyArray];
    
    [super dealloc];
}

@end
