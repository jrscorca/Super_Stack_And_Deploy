//
//  BoardItemModel.h
//  StackAndDeploy
//
//  Created by Joshua Scorca on 4/2/13.
//
//

#import <Foundation/Foundation.h>
@class Ownership;
@interface BoardItemModel : NSObject{
    int maxHealth;
    
    int health;
    
    int ignoreCount;
    
    int armor;
    
    int speed;
    
    NSString *name;
    Ownership *ownership;
    
    NSMutableArray *statuses;
    
    
}
@property (assign) int maxHealth;
@property (nonatomic, retain) Ownership *ownership;
@property (assign) int health;
@property (nonatomic, retain) NSString *name;
@property (nonatomic) int armor;

@property (assign) int ignoreCount;

@property (assign) int speed;

@property (nonatomic, retain) NSMutableArray *statuses;



-(void) hinderedHealthOffset:(int) healthOffset;

@end
