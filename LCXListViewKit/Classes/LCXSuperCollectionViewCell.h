//
//  LCXSuperCollectionViewCell.h
//  LCXUIKit
//
//  Created by lcx on 2020/2/26.
//  Copyright © 2020 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+LCXViewBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface LCXSuperCollectionViewCell : UICollectionViewCell

@property (nonatomic ,strong) id cellModel;

- (void)initCell;

@end

NS_ASSUME_NONNULL_END
