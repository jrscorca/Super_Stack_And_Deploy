//
//  BoardItemModel.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/2/13.
//
//

#import "BoardItemModel.h"
#import "Ownership.h"
@implementation BoardItemModel
@synthesize health, healthBuffer, ignoreCount, statuses, speed, speedBuffer, ownership, name, maxHealth;
-(id)init{
    if(self = [super init]){
        self.statuses = [[[NSMutableArray alloc] init] autorelease];
        self.name = @"No Name";
        self.maxHealth = 0;
        self.ownership = [[[Ownership alloc] init] autorelease];
    }
    return self;
}

-(void)dealloc{
    [name release];
    [statuses release];
    [ownership release];
    [super dealloc];
}

@end
