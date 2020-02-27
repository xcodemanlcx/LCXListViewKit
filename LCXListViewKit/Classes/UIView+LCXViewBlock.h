//
//  UIView+LCXViewBlock.h
//  LCXUIKit
//
//  Created by lcx on 2020/2/26.
//  Copyright © 2020 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LCXViewActionsBlock)(NSInteger actionIndex);

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LCXViewBlock)

@property (nonatomic ,copy) LCXViewActionsBlock lcx_viewActionsBlock;
@property (nonatomic ,copy) dispatch_block_t lcx_viewActionBlock;

@end

NS_ASSUME_NONNULL_END
