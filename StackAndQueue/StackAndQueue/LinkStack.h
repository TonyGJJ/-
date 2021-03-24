//
//  LinkStack.h
//  StackAndQueue
//
//  Created by 刘杨 on 2021/3/24.
//

#import <Foundation/Foundation.h>
#import "StackOperation.h"
#import "StackNode.h"

/// 链式栈
@interface LinkStack : NSObject <StackOperation>

@property (assign, nonatomic) int count;
@property (strong, nonatomic) StackNode *top;

@end
