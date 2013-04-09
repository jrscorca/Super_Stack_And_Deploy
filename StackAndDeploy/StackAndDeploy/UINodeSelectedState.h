//
//  UINodeSelectedState.h
//  StackAndDeploy
//
//  Created by Hunter Francis on 4/9/13.
//
//

#import "UIState.h"

@class NodeSprite;
@interface UINodeSelectedState : UIState{
    NodeSprite *selectedNode;
    BOOL nothingTouched;
    BOOL screenMoved;
}
@property (nonatomic, assign) NodeSprite *selectedNode;


-(id) initWithSelectedNode:(NodeSprite*) _selectedNode andState:(UIState*) state;

@end
