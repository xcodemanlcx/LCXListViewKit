//
//  UICollectionView+LCXCellActionHandle.h
//  LCXUIKit
//
//  Created by lcx on 2020/2/26.
//  Copyright © 2020 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LCXCollectionViewCellActionHandle)(NSIndexPath * _Nonnull actionCellIndexPath,NSInteger cellActionIndex);

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (LCXCellActionHandle)

- (UICollectionViewCell *)lcx_reuseCellID:(NSString *)reuseCellID
                             forIndexPath:(NSIndexPath *)indexPath cellActionHandle:(LCXCollectionViewCellActionHandle)cellActionHandle;

@end

NS_ASSUME_NONNULL_END
