//
//  DoubleStack.h
//  StackAndQueue
//
//  Created by 刘杨 on 2021/3/23.
//

#import <Foundation/Foundation.h>
#import "StackOperation.h"

NS_ASSUME_NONNULL_BEGIN

/// 双栈
@interface DoubleStack : NSObject <StackOperation>
- (void)push:(NSString *)source withStackNumber:(int) number;
- (void)popStackNumber:(int)number;
@end

NS_ASSUME_NONNULL_END
