//
//  CTPeripheralInfo.m
//  CB iOS10
//
//  Created by Max on 15/08/2016.
//  Copyright © 2016 Schneider Electric (Australia) Pty Ltd. All rights reserved.
//

#import "CTPeripheralInfo.h"

@implementation CTPeripheralInfo

+ (NSString *)keyPathSeenCount {
    return NSStringFromSelector(@selector(seenCount));
}

+ (NSString *)keyPathManufactureData {
    return NSStringFromSelector(@selector(manufactureData));
}

@end
