//
//  main.m
//  StackAndQueue
//
//  Created by 刘杨 on 2021/3/23.
//

#import <Foundation/Foundation.h>
#import "OneStack.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        OneStack *oneStack = [[OneStack alloc] init];
        [oneStack createStack];
        for (int i = 1; i <= 10; i++) {
            [oneStack push:[NSString stringWithFormat:@"%d", i]];
        }
        [oneStack pop];
        [oneStack printStack];
    }
    return 0;
}
