//
//  ViewTableViewCell.m
//  折叠单元格
//
//  Created by 房彤 on 2020/9/8.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "ViewTableViewCell.h"

@implementation ViewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _iimageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_iimageView];
    
    _label = [[UILabel alloc] init];
    [self.contentView addSubview:_label];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _iimageView.frame = CGRectMake(5, 5, 25, 25);
    _label.frame = CGRectMake(37, 5, 80, 25);
    _label.font = [UIFont systemFontOfSize:15];
}

@end
