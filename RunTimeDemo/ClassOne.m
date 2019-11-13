//
//  ClassOne.m
//  RunTimeDemo
//
//  Created by 周焕强 on 2019/5/14.
//  Copyright © 2019 zhq. All rights reserved.
//

#import "ClassOne.h"
#import <objc/runtime.h>

@interface ClassOne()<NSCoding>

@end

@implementation ClassOne

- (NSArray *)ignoredPropertys{
    return @[@"one"];
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        // 获取所有成员变量
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList([self class], &outCount);
        
        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivars[i];
            // 将每个成员变量名转换为NSString对象类型
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            // 忽略不需要解档的属性
            if ([[self ignoredPropertys] containsObject:key]) {
                continue;
            }
            
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
            // 相当于 self.one = [aDecoder decodeObjectForKey:@"one"];
        }
        free(ivars);
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    // 获取所有成员变量
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        // 将每个成员变量名转换为NSString对象类型
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        // 忽略不需要解档的属性
        if ([[self ignoredPropertys] containsObject:key]) {
            continue;
        }
        id value = [self valueForKeyPath:key];
        [aCoder encodeObject:value forKey:key];
        // 相当于  [aCoder encodeObject:@(self.one) forKey:@"one"]

    }
    free(ivars);
}

+ (void)classOneMethod{
    NSLog(@"classOneMethod");
}

@end
