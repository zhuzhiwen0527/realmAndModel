//
//  YModel1.m
//  yyModelRealm
//
//  Created by zzw on 2017/4/26.
//  Copyright © 2017年 zzw. All rights reserved.
//

#import "YModel1.h"

@implementation YModel1
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    
    return @{
             @"sectorMmodel":YModel2.class
             };
    
}
@end
