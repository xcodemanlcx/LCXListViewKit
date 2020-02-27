//
//  TableViewCell.m
//  LCXListViewKit
//
//  Created by lcx on 2020/2/26.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "TableViewCell.h"
#import "CellModel.h"

#define kBaseTag 1000

#define UIScreen_Width [UIScreen mainScreen].bounds.size.width

@implementation TableViewCell
{
    UILabel *_titleLab;
}
- (void)initCell{
    CGFloat btnW = UIScreen_Width/3;
    CGFloat contentViewHeight = self.contentView.bounds.size.height; UIScreen_Width/3;

    for (int i = 0; i < 2; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:btn];
        btn.frame = CGRectMake(i*btnW, 0, btnW, contentViewHeight);
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTag:kBaseTag+i];
        [btn setTitle:[@"button" stringByAppendingString:@(i).stringValue] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(btnW*2, 0, btnW, contentViewHeight)];
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
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
