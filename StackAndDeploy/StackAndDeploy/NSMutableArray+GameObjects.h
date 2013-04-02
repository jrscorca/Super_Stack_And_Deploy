//
//  NSMutableArray+GameObjectSprites.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 3/30/13.
//
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (GameObjects)

//use this to destroy all the objects in an array
-(void) destroyObjectsInArray;
    
// use instead of releasing array to dealloc
// removes arrays' association with GameObjectSprites
-(void) destroyArray;

@end
