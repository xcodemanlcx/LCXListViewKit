//
//  CollectionViewCell.m
//  LCXListViewKit_Example
//
//  Created by lcx on 2020/2/27.
//  Copyright © 2020 475512103@qq.com. All rights reserved.
//

#import "CollectionViewCell.h"
#import "CellModel.h"

#define kBaseTag 1000

#define UIScreen_Width [UIScreen mainScreen].bounds.size.width

@implementation CollectionViewCell
{
    UILabel *_titleLab;
}
- (void)initCell{
    self.contentView.backgroundColor = [UIColor whiteColor];
    CGFloat btnW = UIScreen_Width/4;
    CGFloat btwH = 30;

    for (int i = 0; i < 2; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:btn];
        btn.frame = CGRectMake(0, i*btwH, btnW, btwH);
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTag:kBaseTag+i];
        [btn setTitle:[@"button" stringByAppendingString:@(i).stringValue] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, btwH*2, btnW, btwH)];
    [self.contentView addSubview:lab];
    lab.font = [UIFont systemFontOfSize:20];
    lab.textColor = [UIColor blackColor];
    lab.textAlignment = NSTextAlignmentCenter;
    _titleLab = lab;
}

- (void)btnAction:(UIButton *)sender{
    if (self.lcx_viewActionsBlock) {
        self.lcx_viewActionsBlock(sender.tag - kBaseTag);
    }
}

- (void)setCellModel:(id)cellModel{
    if (!cellModel || ![cellModel isKindOfClass:CellModel.class]) return;
    CellModel *model = cellModel;
    _titleLab.text = [@"model" stringByAppendingString:model.title];
}

@end
