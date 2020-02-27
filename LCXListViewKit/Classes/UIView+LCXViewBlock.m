//
//  UIView+LCXViewBlock.m
//  LCXUIKit
//
//  Created by lcx on 2020/2/26.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "UIView+LCXViewBlock.h"
#import <objc/runtime.h>

@implementation UIView (LCXViewBlock)

#pragma mark - property:lcx_viewActionsBlock

- (LCXViewActionsBlock)lcx_viewActionsBlock{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLcx_viewActionsBlock:(LCXViewActionsBlock)lcx_viewActionsBlock{
    objc_setAssociatedObject(self, @selector(lcx_viewActionsBlock), lcx_viewActionsBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - property:lcx_viewActionBlock

- (dispatch_block_t)lcx_viewActionBlock{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLcx_viewActionBlock:(dispatch_block_t)lcx_viewActionBlock{
    objc_setAssociatedObject(self, @selector(lcx_viewActionBlock), lcx_viewActionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
