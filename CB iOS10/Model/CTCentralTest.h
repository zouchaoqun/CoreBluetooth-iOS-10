//
//  CTCentralTest.h
//  CB iOS10
//
//  Created by Max on 15/08/2016.
//  Copyright © 2016 Schneider Electric (Australia) Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTPeripheralInfo.h"

@interface CTCentralTest : NSObject

@property (strong, nonatomic) NSArray<CTPeripheralInfo *> *peripherals;
+ (NSString *)keyPathPeripherals;

+ (instancetype)sharedInstance;

- (void)startScan;

- (void)stopScan;

@end
