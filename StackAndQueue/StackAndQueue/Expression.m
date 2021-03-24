//
//  Expression.m
//  StackAndQueue
//
//  Created by 刘杨 on 2021/3/24.
//

#import "Expression.h"
#import "OneStack.h"

@implementation Expression {
    NSMutableArray *_infixArray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _infixArray = [[NSMutableArray alloc] init];
    }
    return self;
}

// 中缀表达式转后缀表达式
- (void)test {
    // input 9+(3-1)×3+10÷2
    // ouput 9 3 1 - 3 * + 10 2 / +
    OneStack *stack = [[OneStack alloc] init];
    [stack createStack];
    NSMutableArray *ss = @[@"9",
                           @"+",
                           @"(",
                           @"3",
                           @"-",
                           @"1",
                           @")",
                           @"x",
                           @"3",
                           @"+",
                           @"10",
                           @"÷",
                           @"2"
                         ].mutableCopy;
    
    for (int i = 0; i < [ss count]; i++) {
        NSString *temp = ss[i];
        if ([temp isEqualToString:@"x"]) {
            temp = @"*";
        } else if ([temp isEqualToString:@"÷"]) {
            temp = @"/";
        }
        
        if ([temp intValue]) {
            [_infixArray addObject:temp];
        } else {
            NSString *topString = [stack getTopStackData];
            if (topString.length == 0) {
                [stack push:temp];
            } else if ([temp isEqualToString:@"("]) {
                [stack push:temp];
            } else if ([temp isEqualToString:@")"]) {
                NSString *temp2 = [stack getTopStackData];
                while (![temp2 isEqualToString:@"("] &&
                       ![temp2 isEqualToString:@")"]) {
                    temp2 = [stack getTopStackData];
                    if (![temp2 isEqualToString:@"("] &&
                        ![temp2 isEqualToString:@")"]) {
                        [_infixArray addObject:temp2];
                    }
                    [stack pop];
                }
            } else {
                // 处理运算先后
                NSString *temp2 = [stack getTopStackData];
                NSString *temp3 = [self comparePriorityPriority:temp twoPriority:temp2];
                [stack push:temp];
            }
        }
    }
}

- (NSString *)comparePriorityPriority:(NSString *)one twoPriority:(NSString *)two {
    if ([one isEqualToString:@"*"] && [two isEqualToString:@"+"]) {
        return one;
    } else if([one isEqualToString:@"*"] && [two isEqualToString:@"-"]) {
        return one;
    } else if([one isEqualToString:@"/"] && [two isEqualToString:@"+"]) {
        return one;
    } else if([one isEqualToString:@"/"] && [two isEqualToString:@"-"]) {
        return one;
    } else if ([one isEqualToString: two]){
        return one;
    }
    return one;
}
@end
