//
//  CardItem.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "CardItem.h"
#import "CardVO.h"

@implementation CardItem

@synthesize name, details, cost, techReq;

-(id) initWithCardVO:(CardVO*) cardVO{
    if(self = [super initWithFile:@"Icon-72.png"]){
        self.name = @"first Card";
        self.details = @"something";
        self.cost = 2;
        self.techReq = 2;
        
    }
    return self;
}

-(void) dealloc{
    [name release];
    [details release];
    [super dealloc];
}

@end
