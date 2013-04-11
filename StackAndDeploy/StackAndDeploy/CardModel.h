//
//  CardModel.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/11/13.
//
//

#import <Foundation/Foundation.h>
@class CardVO;
@interface CardModel : NSObject{
    NSString *name;
    NSString *details;
    cardType type;
    NSMutableArray *statuses;

}
@property (assign) cardType type;
@property (nonatomic, retain) NSString* name, *details;
@property (nonatomic, retain) NSMutableArray *statuses;
-(id) initWithCardVO:(CardVO*) cardVO;

@end
