//
//  Ownership.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/8/13.
//
//

#import <Foundation/Foundation.h>

@interface Ownership : NSObject{
    playerNumber playerNumber;
    playerType playerType;
    
}

@property (assign) playerNumber playerNumber;
@property (assign) playerType playerType;

-(id) initWithOwner:(Ownership*)owner;

-(id) initWithPlayerNumber:(playerNumber) number;

-(id) initWithPlayerType:(playerType) type;

@end
