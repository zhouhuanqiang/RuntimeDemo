//
//  ViewController.m
//  RunTimeDemo
//
//  Created by 周焕强 on 2019/5/14.
//  Copyright © 2019 zhq. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "ClassOne.h"
#import "ClassTwo.h"
#import "ClassOne+Category.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 获取类方法
    Method method1 = class_getClassMethod([ClassOne class], @selector(classOneMethod));
    Method method2 = class_getClassMethod([ClassTwo class], @selector(classTwoMethod));
    
    // 交换方法
    method_exchangeImplementations(method1, method2);
    
    [ClassOne classOneMethod];
    [ClassTwo classTwoMethod];
    
    
    ClassOne *classOne = [[ClassOne alloc] init];
    classOne.age = @"10";
    NSLog(@"age:%@", classOne.age);
    
}


@end
