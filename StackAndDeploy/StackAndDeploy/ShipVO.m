//
//  ShipVO.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import "ShipVO.h"
#import "StatusVO.h"

@implementation ShipVO
@synthesize health,speed,statuses;

-(id)initWithDictionary:(NSDictionary*)dic{
    if(self = [super init]){
        health = [[dic objectForKey:@"health"] intValue];
        speed =[[dic objectForKey:@"speed"] floatValue];
        statuses = [[NSMutableArray alloc] init];
        for (NSDictionary *statusDic in [dic objectForKey:@"statuses"]){
            [statuses addObject:[[StatusVO alloc] initWithDictionary:statusDic]];
        }

        
    }
    return self;
}

-(void)dealloc{
    [statuses release];
    [super dealloc];
}

@end
