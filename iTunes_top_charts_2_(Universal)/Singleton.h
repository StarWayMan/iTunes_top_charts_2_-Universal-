//
//  Singleton.h
//  iTunes_top_charts_2_(Universal)
//
//  Created by Edip Asanov on 08.10.14.
//  Copyright (c) 2014 Edip Asanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject {
    NSString *globalMediaType;
    NSString *globalKey;
}

+(instancetype) sharedInstance;

// следующие объявления сгенерируют compile time ошибки при попытке их вызвать вручную.
+(instancetype) alloc __attribute__((unavailable("alloc not available, call sharedInstance instead")));
-(instancetype) init __attribute__((unavailable("init not available, call sharedInstance instead")));
+(instancetype) new __attribute__((unavailable("new not available, call sharedInstance instead")));

@property (nonatomic) NSString *globalMediaType;
@property (nonatomic) NSString *globalKey;

@end

