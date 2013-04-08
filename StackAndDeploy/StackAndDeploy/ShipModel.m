//
//  ShipModel.m
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/2/13.
//
//

#import "ShipModel.h"

@implementation ShipModel

@synthesize abilityArray;

-(id) init{
    if(self = [super init]){
        self.abilityArray = [NSMutableArray array];
        self.maxHealth = 10;
        
        //hardcode an ability
        
    }
    return self;
}

@end
