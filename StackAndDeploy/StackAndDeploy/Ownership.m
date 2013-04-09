//
//  Ownership.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/8/13.
//
//

#import "Ownership.h"

@implementation Ownership
@synthesize playerType, playerNumber;

-(id) initWithOwner:(Ownership*)owner{
    if(self = [super init]){
        self.playerType = owner.playerType;
        self.playerNumber = owner.playerNumber;
    }
    return self;

}

//TODO: set both variables
-(id) initWithPlayerNumber:(playerNumber) number{
    if(self = [super init]){
//        self.playerType = owner.playerType;
        self.playerNumber = number;
    }
    return self;
    
}

-(id) initWithPlayerType:(playerType) type{
    if(self = [super init]){
        self.playerType = type;
//      self.playerNumber = owner.playerNumber;
    }
    return self;
    
}

@end
