//
//  main.m
//  StackAndQueue
//
//  Created by 刘杨 on 2021/3/23.
//

#import <Foundation/Foundation.h>
#import "OneStack.h"
#import "DoubleStack.h"
#import "LinkStack.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        OneStack *oneStack = [[OneStack alloc] init];
//        [oneStack createStack];
//        for (int i = 1; i <= 10; i++) {
//            [oneStack push:[NSString stringWithFormat:@"%d", i]];
//        }
//        [oneStack pop];
//        [oneStack printStack];
//        DoubleStack *doubleStack = [[DoubleStack alloc] init];
//        [doubleStack createStack];
//        int i;
//        for (i = 1; i <= 5; i ++) {
//            [doubleStack push:[NSString stringWithFormat:@"%d", i] withStackNumber:1];
//        }
//        for (i = 20; i >= 20 - 2 ; i--) {
//            [doubleStack push:[NSString stringWithFormat:@"%d", i] withStackNumber:2];
//        }
//
//        [doubleStack printStack];
        
        LinkStack *linkStack = [[LinkStack alloc] init];
        [linkStack createStack];
        [linkStack push:@"A"];
        [linkStack push:@"B"];
        [linkStack push:@"C"];
        [linkStack push:@"D"];
        [linkStack push:@"E"];
        [linkStack printStack];
        
        NSLog(@"当前栈顶 元素 %@", [linkStack getTopStackData]);
        
        NSLog(@"执行pop 操作");
        [linkStack pop];
        [linkStack pop];
        [linkStack pop];
        [linkStack pop];
        [linkStack pop];
        [linkStack pop];
        [linkStack pop];
        [linkStack printStack];
    }
    return 0;
}
