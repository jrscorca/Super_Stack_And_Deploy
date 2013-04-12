//
//  AbilityVO.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/12/13.
//
//

#import <Foundation/Foundation.h>

@interface AbilityVO : NSObject{
    NSString *className;
    NSDictionary *arguments;
}

@property(nonatomic, retain) NSString *className;
@property(nonatomic, retain) NSDictionary *arguments;

-(id)initWithDictionary:(NSDictionary*)dic;

@end
