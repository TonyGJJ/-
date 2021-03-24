//
//  LinkStack.m
//  StackAndQueue
//
//  Created by 刘杨 on 2021/3/24.
//

#import "LinkStack.h"
#import "StackNode.h"

@interface LinkStack ()

@property (assign, nonatomic) int count;
@property (strong, nonatomic) StackNode *top;

@end

@implementation LinkStack

/// 创建堆栈
- (void)createStack {
    self.count = 0;
    self.top = nil;
}

- (void)push:(NSString *)souce {
    StackNode *node = [[StackNode alloc] init];
    node.data = souce;
    node.next = self.top;
    self.top = node;
    self.count ++;
}

- (void)pop {
    if (self.top == nil) {
        NSLog(@"pop失败，因为当前为空栈");
        return;
    }
    self.top = self.top.next;
    self.count --;
}

- (NSString *)getTopStackData {
    return self.top.data;
}

- (int)getTop {
    return self.count;
}

- (void)clear {
    self.top = nil;
    self.count = 0;
}

- (void)printStack {
    if (self.top == nil) {
        NSLog(@"当前栈是空栈，不能打印");
        return;
    }
    StackNode *node = self.top;
    while (node != nil) {
        NSLog(@"node.data ==== %@", node.data);
        node = node.next;
    }
}
@end
