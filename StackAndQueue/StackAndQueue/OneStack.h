//
//  OneStack.h
//  StackAndQueue
//
//  Created by 刘杨 on 2021/3/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OneStack : NSObject

/// 创建堆栈
- (void)createStack;

/// 进栈
/// @param souce 数据
- (void)push:(NSString *)souce;

/// 出栈
- (void)pop;

/// 获取栈顶的数据
- (NSString *)getTopStackData;

/// 获取栈顶的位置
- (int)getTop;

/// 清空栈
- (void)clear;

/// 打印堆栈数据
- (void)printStack;

@end

NS_ASSUME_NONNULL_END
