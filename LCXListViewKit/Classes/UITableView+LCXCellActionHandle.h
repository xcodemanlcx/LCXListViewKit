//
//  UITableView+LCXCellActionHandle.h
//  LCXUIKit
//
//  Created by lcx on 2020/2/26.
//  Copyright © 2020 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LCXCellActionHandle)(NSIndexPath * _Nonnull actionCellIndexPath,NSInteger cellActionIndex);

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (LCXCellActionHandle)

- (UITableViewCell *)lcx_reuseCellID:(NSString *)reuseCellID cellActionHandle:(LCXCellActionHandle)cellActionHandle;

@end

NS_ASSUME_NONNULL_END
