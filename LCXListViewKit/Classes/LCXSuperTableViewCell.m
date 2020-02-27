//
//  LCXSuperTableViewCell.m
//  LCXUIKit
//
//  Created by lcx on 2020/2/26.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "LCXSuperTableViewCell.h"

@implementation LCXSuperTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCell];
    }
    return self;
}

- (void)initCell{
    
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
