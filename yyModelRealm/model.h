//
//  model.h
//  yyModelRealm
//
//  Created by zzw on 2017/4/26.
//  Copyright © 2017年 zzw. All rights reserved.
//

#import <Realm/Realm.h>
#import "model1.h"

RLM_ARRAY_TYPE(model1)
@interface model : RLMObject
@property NSString * status;
@property NSString * msg;
@property RLMArray <model1> * data;
@end
