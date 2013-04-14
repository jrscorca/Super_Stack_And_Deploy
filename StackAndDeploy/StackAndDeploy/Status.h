//
//  Status.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/3/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class BoardItemSprite, StatusVO;
@interface Status : NSObject{
    BoardItemSprite *target;
    CGPoint targetPoint;
    BOOL hasBeenApplied;
}

@property (nonatomic, assign) BoardItemSprite *target;

-(id)initWithStatusVO:(StatusVO*)statusVO;

-(void) addStatusToGameObject:(BoardItemSprite*)gameObject;

-(void) addStatusToGameBoard:(CGPoint)point;

-(BOOL) checkStart;

-(void) applyStatus;

-(void) revertStatus;

-(BOOL) checkEnd;

-(void) updateStatus:(ccTime) dt;

-(void) reccuringEffect:(ccTime) dt;



@end
