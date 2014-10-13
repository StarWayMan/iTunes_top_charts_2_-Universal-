//
//  Singleton.m
//  iTunes_top_charts_2_(Universal)
//
//  Created by Edip Asanov on 08.10.14.
//  Copyright (c) 2014 Edip Asanov. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton {
    Singleton *newSingleton;
}

@synthesize globalKey;
@synthesize globalMediaType;

+(instancetype) sharedInstance {
    static dispatch_once_t pred;
    static id shared = nil;
    dispatch_once(&pred, ^{
        shared = [[super alloc] initUniqueInstance];
    });
    return shared;
}

-(instancetype) initUniqueInstance {
    return [super init];
}

@end
