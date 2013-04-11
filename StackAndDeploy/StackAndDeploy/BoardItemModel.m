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
@synthesize health, ignoreCount, statuses, speed, ownership, name, maxHealth, armor;;
-(id)init{
    if(self = [super init]){
        self.statuses = [[[NSMutableArray alloc] init] autorelease];
        self.name = @"No Name";
        self.maxHealth = 0;
        self.ownership = [[[Ownership alloc] init] autorelease];
        self.armor = 0;
    }
    return self;
}

-(void)dealloc{
    [name release];
    [statuses release];
    [ownership release];
    [super dealloc];
}


-(void) hinderedHealthOffset:(int) healthOffset{
    if(healthOffset > 0){
        self.health += healthOffset;
        
    }else{
        int actualHealthChange = healthOffset;
        
        actualHealthChange -= armor;

        //always do at least 1 damage
        if(actualHealthChange < 1){
            actualHealthChange = 1;
        }
        self.health += healthOffset;
    }
    
    
    
    
}

@end
