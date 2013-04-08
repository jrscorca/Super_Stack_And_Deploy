//
//  BoardItemModel.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/2/13.
//
//

#import <Foundation/Foundation.h>

@interface BoardItemModel : NSObject{
    int maxHealth;
    
    int health;
    int healthBuffer;
    
    int ignoreCount;
    
    int speed;
    int speedBuffer;
    
    NSString *name;
    playerType ownership;
    
    NSMutableArray *statuses;
    
    
}
@property (assign) int maxHealth;
@property (assign) playerType ownership;
@property (assign) int health;
@property (assign) int healthBuffer;
@property (nonatomic, retain) NSString *name;

@property (assign) int ignoreCount;

@property (assign) int speed;
@property (assign) int speedBuffer;

@property (nonatomic, retain) NSMutableArray *statuses;

@end
