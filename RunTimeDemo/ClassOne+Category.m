//
//  ClassOne+Category.m
//  RunTimeDemo
//
//  Created by 周焕强 on 2019/5/27.
//  Copyright © 2019 zhq. All rights reserved.
//

#import "ClassOne+Category.h"
#import <objc/runtime.h>

@implementation ClassOne (Category)

char nameKey;

- (void)setAge:(NSString *)age{
    objc_setAssociatedObject(self, &nameKey, age, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)age{
    return objc_getAssociatedObject(self, &nameKey);
}

@end
