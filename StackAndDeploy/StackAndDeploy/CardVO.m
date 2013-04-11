//
//  CardVO.m
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import "CardVO.h"
#import "StatusVO.h"

@implementation CardVO
@synthesize type, name, details, abilityState, statuses;

-(id)initWithDictionary:(NSDictionary*)dic{
    if(self = [super init]){
        name = [dic objectForKey:@"name"];
        details = [dic objectForKey:@"details"];
        abilityState = [dic objectForKey:@"abilityStateDic"];
        statuses = [[NSMutableArray alloc] init];
        for (NSDictionary *statusDic in [dic objectForKey:@"statuses"]){
            StatusVO *status = [[StatusVO alloc] initWithDictionary:statusDic];
            [statuses addObject:status];
        }
        type = [[dic objectForKey:@"type"] intValue];
    }
    return self;
}

-(void)dealloc{
    [statuses release];
    [super dealloc];
}

@end
