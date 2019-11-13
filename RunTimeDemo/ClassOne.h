//
//  ClassOne.h
//  RunTimeDemo
//
//  Created by 周焕强 on 2019/5/14.
//  Copyright © 2019 zhq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClassOne : NSObject

@property (nonatomic, copy) NSString *one;
@property (nonatomic, copy) NSString *two;
@property (nonatomic, copy) NSString *three;


+ (void)classOneMethod;

@end

NS_ASSUME_NONNULL_END
