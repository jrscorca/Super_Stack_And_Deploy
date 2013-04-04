//
//  Status.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/3/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class BoardItemModel;
@interface Status : NSObject{
    BoardItemModel *target;
    BOOL hasBeenApplied;
}

-(void) addStatusToGameObject:(BoardItemModel*)gameObject;

-(BOOL) checkStart;

-(void) applyStatus;

-(void) revertStatus;

-(BOOL) checkEnd;

-(void) updateStatus:(ccTime) dt;

-(void) reccuringEffect:(ccTime) dt;



@end
