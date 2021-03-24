//
//  StackNode.h
//  StackAndQueue
//
//  Created by 刘杨 on 2021/3/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StackNode : NSObject

@property (strong, nonatomic) id data;
@property (strong, nonatomic) StackNode *next;

@end

NS_ASSUME_NONNULL_END
