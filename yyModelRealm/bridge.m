//
//  bridge.m
//  yyModelRealm
//
//  Created by zzw on 2017/4/26.
//  Copyright © 2017年 zzw. All rights reserved.
//

#import "bridge.h"
#import "model1.h"
#import "model2.h"
#import "model.h"
#import "YModel.h"

@interface bridge ()
{
    AFHTTPSessionManager * session;
    //http://123.56.132.195:8081/kxbi/quanxian/getSector.shtml
}
@end

@implementation bridge

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        session = [AFHTTPSessionManager manager];
        session.requestSerializer = [AFHTTPRequestSerializer serializer];
        [self getDataSource];
        
    }
    return self;
}


- (void)getDataSource{
    
  
    [session POST:@"http://123.56.132.195:8081/kxbi/quanxian/getSector.shtml" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       //YYModel
        YModel * ym = [YModel yy_modelWithDictionary:responseObject];
        //MjExtension 可以转化realm
        model *  m = [model mj_objectWithKeyValues:responseObject] ;
        //用reaml 保存
        [self mjSaveWith:m];
        
        [self saveDataWith:ym];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

- (void)mjSaveWith:(RLMObject *)obj{

    RLMRealm * realm = [RLMRealm defaultRealm];
    //开启事务
    [realm beginWriteTransaction];
    //保存到realm
    [realm addObject:obj];
    //提交事务
    [realm commitWriteTransaction];

}

//
- (void)saveDataWith:(YModel*)mo{
  
    model * ff = [[model alloc] init];
    
    ff.status = mo.status;
    ff.msg = mo.msg;
    
    for (NSInteger i = 0 ; i < mo.data.count; i++) {
        //获取模型数据
        YModel1 * ym1 = mo.data[i];
        
        model1 * m1 = [[model1 alloc] init];
        m1.parent_cname = ym1.parent_cname;
        
        for (NSInteger j = 0; j < ym1.sectorMmodel.count; j++) {
            
            YModel2 * ym2 = ym1.sectorMmodel[j];
            
            model2 * m2 = [[model2 alloc] init];
            m2.cname = ym2.cname;
            
            [m1.sectorMmodel addObject:m2];
        }
        
        [ff.data addObject:m1];
    }
    
    
    
    RLMRealm * realm = [RLMRealm defaultRealm];
    //开启事务
    [realm beginWriteTransaction];
    //保存到realm
    [realm addObject:ff];
    //提交事务
    [realm commitWriteTransaction];
    
//    NSLog(@"%ld",[[model2 allObjects] count]);
    
    RLMResults * results = [model2 objectsWhere:@"cname = '茶饮料'"];
    
    NSLog(@"%ld",results.count);
    
    
    RLMResults * result = [model2 objectsWhere:@"cname contains '饮'"];
     NSLog(@"%ld",result.count);
    //
    //    model2 * m = [[model2 alloc] init];
    //    m.cname = @"测试1";
    //
    //    model1 * f =[[model1 alloc] init];
    //    f.parent_cname = @"测试1";
    //    [f.model2s addObject:m];
    //
    //    RLMRealm * realm = [RLMRealm defaultRealm];
    //    //开启事务
    //    [realm beginWriteTransaction];
    //    //保存到realm
    //    [realm addObject:f];
    //    //提交事务
    //    [realm commitWriteTransaction];
    
    
    
    
    
}


@end
