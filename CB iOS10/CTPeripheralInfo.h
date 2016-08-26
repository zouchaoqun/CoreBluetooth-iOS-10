//
//  CTPeripheralInfo.h
//  CB iOS10
//
//  Created by Max on 15/08/2016.
//  Copyright © 2016 Schneider Electric (Australia) Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTPeripheralInfo : NSObject

@property (copy, nonatomic) NSString *name;

@property (copy, nonatomic) NSString *identifier;

@property (nonatomic) NSInteger seenCount;
+ (NSString *)keyPathSeenCount;

@property (copy, nonatomic) NSData *manufactureData;
+ (NSString *)keyPathManufactureData;

@end
