//
//  DoubleStack.h
//  StackAndQueue
//
//  Created by 刘杨 on 2021/3/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DoubleStack : NSObject
- (void)createStack;
- (void)push:(NSString *)source withStackNumber:(int) number;
- (void)popStackNumber:(int)number;
- (void)clear;
- (void)printStack;
@end

NS_ASSUME_NONNULL_END
