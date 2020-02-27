//
//  UICollectionView+LCXCellActionHandle.m
//  LCXUIKit
//
//  Created by lcx on 2020/2/26.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "UICollectionView+LCXCellActionHandle.h"
#import "UIView+LCXViewBlock.h"

@implementation UICollectionView (LCXCellActionHandle)

- (UICollectionViewCell *)lcx_reuseCellID:(NSString *)reuseCellID
                             forIndexPath:(NSIndexPath *)indexPath cellActionHandle:(LCXCollectionViewCellActionHandle)cellActionHandle{
    
    UICollectionViewCell *cell = [self dequeueReusableCellWithReuseIdentifier:reuseCellID forIndexPath:indexPath];
    
    if (cellActionHandle) {
            if (!cell.lcx_viewActionsBlock) {
                __weak typeof(self) weakSelf = self;
                __weak typeof(cell) weakCell = cell;
                cell.lcx_viewActionsBlock = ^(NSInteger cellActionIndex) {
                    
                    //响应cell的IndexPath
                    NSIndexPath *actionCellIndexPath = [weakSelf indexPathForCell:weakCell];
                    
                   //cell中元素的事件处理
                    cellActionHandle(actionCellIndexPath,cellActionIndex);
                };
        }
    }
    return cell;
}

@end
