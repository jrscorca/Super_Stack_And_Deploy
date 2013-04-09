//
//  StatusVO.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/8/13.
//
//

#import <Foundation/Foundation.h>

@interface StatusVO : NSObject{
    NSString *className;
    NSDictionary *arguments;
}

@property(nonatomic, retain) NSString *className;
@property(nonatomic, retain) NSDictionary *arguments;

-(id)initWithDictionary:(NSDictionary*)dic;
@end
