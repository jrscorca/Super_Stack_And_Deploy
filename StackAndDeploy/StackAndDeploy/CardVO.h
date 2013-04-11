//
//  CardVO.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/27/13.
//
//

#import <Foundation/Foundation.h>
#import "GameObjectVO.h"

@class UIAbilityState;
@interface CardVO : GameObjectVO{
    NSString *name;
    NSString *details;
    //requirements
    UIAbilityState *abilityState;
    NSMutableArray *statuses;
    cardType type;
}

@property (assign) cardType type;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *details;
//requirements
@property (nonatomic, retain) UIAbilityState *abilityState;
@property (nonatomic, retain) NSMutableArray *statuses;

-(id)initWithDictionary:(NSDictionary*)dic;

@end
