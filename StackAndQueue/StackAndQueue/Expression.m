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
    OneStack *stack;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _infixArray = [[NSMutableArray alloc] init];
        stack = [[OneStack alloc] init];
        [stack createStack];
    }
    return self;
}

// 中缀表达式转后缀表达式
- (void)test {
    // input 9+(3-1)×3+10÷2
    // ouput 9 3 1 - 3 * + 10 2 / +
    
    NSArray *ss = @[
        @"9",
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
    ];
    
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
                NSString *symbol = [self comparePriorityWithTop:temp];
                
                if ([symbol isEqualToString:@"<"]) {
                    NSString *newTemp = [stack getTopStackData];
                    while (newTemp.length != 0) {
                        [_infixArray addObject:newTemp];
                        [stack pop];
                        newTemp = [stack getTopStackData];
                    }
                    [stack push:temp];
                } else {
                    if ([symbol isEqualToString:@"=="]) {
                        [stack push:temp];
                    } else {
                        if (temp2 == temp3) {
                            [_infixArray addObject:temp3];
                        } else {
                            [stack push:temp];
                        }
                    }
                }
            }
        }
    }
    
    NSString *temp2 = [stack getTopStackData];
    while (temp2.length != 0) {
        [_infixArray addObject:temp2];
        [stack pop];
        temp2 = [stack getTopStackData];
    }
    
    NSLog(@"%@", [_infixArray componentsJoinedByString:@" "]);
}


/// 和栈顶比较优先级
/// YES 表示 优先级高于栈顶
/// NO  表示 优先级低于栈顶
/// @param symbol 符号
- (NSString *)comparePriorityWithTop:(NSString *)symbol {
    NSString *topSymbol = [stack getTopStackData];
    
    if ([topSymbol isEqualToString:@"("] || [topSymbol isEqualToString:@")"]) {
        return @"==";
    }
    
    if ([symbol isEqualToString:@"("] || [symbol isEqualToString:@")"]) {
        return @"==";
    }
    
    int symbolInt = 0;
    int topStackInt = 0;
    
    if ([symbol isEqualToString:@"*"] ||
        [symbol isEqualToString:@"/"]) {
        symbolInt = 2;
    } else if ([symbol isEqualToString:@"+"] ||
               [symbol isEqualToString:@"-"]) {
        symbolInt = 1;
    }
    
    if ([topSymbol isEqualToString:@"+"] ||
        [topSymbol isEqualToString:@"-"]) {
        topStackInt = 1;
    } else if ([topSymbol isEqualToString:@"*"] ||
               [topSymbol isEqualToString:@"/"]) {
        topStackInt = 2;
    }
    
    if (symbolInt == topStackInt) {
        return @"==";
    } else if (symbolInt > topStackInt) {
        return @">";
    } else {
        return @"<";
    }
}

- (NSString *)comparePriorityPriority:(NSString *)one twoPriority:(NSString *)two {
    if ([one isEqualToString:@"*"] || [two isEqualToString:@"*"]) {
        return @"*";
    } else if([one isEqualToString:@"/"] || [two isEqualToString:@"/"]) {
        return @"/";
    } else if ([one isEqualToString: two]){
        return one;
    }
    return one;
}
@end
