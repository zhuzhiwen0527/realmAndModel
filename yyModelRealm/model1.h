//
//  model1.h
//  yyModelRealm
//
//  Created by zzw on 2017/4/26.
//  Copyright © 2017年 zzw. All rights reserved.
//

#import <Realm/Realm.h>
#import "model2.h"
RLM_ARRAY_TYPE(model2)
@interface model1 : RLMObject
@property NSString * parent_cname;
@property RLMArray <model2> * sectorMmodel;
@end
