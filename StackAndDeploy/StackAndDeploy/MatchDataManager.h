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
}

@property (nonatomic, retain) LocalPlayer *localPlayer;
@property (nonatomic, retain) AwayPlayer *awayPlayer;


+ (MatchDataManager*)sharedInstance;

@end
