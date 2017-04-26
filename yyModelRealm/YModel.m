//
//  YModel.m
//  yyModelRealm
//
//  Created by zzw on 2017/4/26.
//  Copyright © 2017年 zzw. All rights reserved.
//

#import "YModel.h"

@implementation YModel
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    
    return @{
             @"data":YModel1.class
             };
    
}
@end
