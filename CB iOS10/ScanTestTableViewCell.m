//
//  ScanTestTableViewCell.m
//  CB iOS10
//
//  Created by Max on 15/08/2016.
//  Copyright © 2016 Schneider Electric (Australia) Pty Ltd. All rights reserved.
//

#import "ScanTestTableViewCell.h"

@implementation ScanTestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.textLabel.adjustsFontSizeToFitWidth = YES;
    self.textLabel.minimumScaleFactor = 0.5;
}

- (void)dealloc {
    [self removeCurrentObserver];
}

- (void)removeCurrentObserver {
    if (self.info) {
        [self.info removeObserver:self forKeyPath:[CTPeripheralInfo keyPathSeenCount]];
        [self.info removeObserver:self forKeyPath:[CTPeripheralInfo keyPathManufactureData]];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setInfo:(CTPeripheralInfo *)info {
 
    if (_info != info) {
        
        [self removeCurrentObserver];
        
        _info = info;
        [_info addObserver:self forKeyPath:[CTPeripheralInfo keyPathSeenCount] options:NSKeyValueObservingOptionInitial context:nil];
        [_info addObserver:self forKeyPath:[CTPeripheralInfo keyPathManufactureData] options:NSKeyValueObservingOptionInitial context:nil];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:[CTPeripheralInfo keyPathSeenCount]]) {
        
        [self updateText];
    }
    else if ([keyPath isEqualToString:[CTPeripheralInfo keyPathManufactureData]]) {
        
        [self updateManufactureData];
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    
}

- (void)updateText {
 
    dispatch_async(dispatch_get_main_queue(), ^{
        
//        detailTextLabel =  [NSString stringWithFormat:@"%@ (%@) %li", self.info.name, self.info.identifier, (long)(self.info.seenCount + 1)];
        self.detailTextLabel.text =  [NSString stringWithFormat:@"%@ (%@)", self.info.name, self.info.identifier];
    });
    
}

- (void)updateManufactureData {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.textLabel.text =  [NSString stringWithFormat:@"%@", self.info.manufactureData];
    });
}

@end
