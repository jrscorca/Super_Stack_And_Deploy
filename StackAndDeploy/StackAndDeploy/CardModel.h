//
//  CardModel.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/11/13.
//
//

#import <Foundation/Foundation.h>
@class CardVO, Ability;
@interface CardModel : NSObject{
    NSString *name;
    NSString *details;
    cardType type;
    Ability *ability;

}
@property (assign) cardType type;
@property (nonatomic, retain) NSString* name, *details;
@property (nonatomic, retain) Ability *ability;

-(id) initWithCardVO:(CardVO*) cardVO;

@end
