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
        for (NSDictionary *statusDic in [dic objectForKey:@"statuses"]){
            StatusVO *status = [[StatusVO alloc] initWithDictionary:statusDic];
        }
    }
    return self;
}

@end
