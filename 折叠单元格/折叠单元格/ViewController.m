//
//  ViewController.m
//  折叠单元格
//
//  Created by 房彤 on 2020/9/8.
//  Copyright © 2020 房彤. All rights reserved.
//

#import "ViewController.h"
#import "ViewTableViewCell.h"
#import "Masonry.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.92 alpha:1];
    
    _imageViewArr = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
    _labelArr = [[NSMutableArray alloc] initWithObjects:@"发起群聊", @"添加朋友", @"扫一扫", @"收付款", @"帮助与反馈", nil];
    
    _tableView = [[UITableView alloc] init];
    [self.view addSubview:_tableView];

    //_tableView.frame = CGRectMake(100, 100, 130, 35);
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(self.view.frame.size.height * 0.0485);
        make.width.mas_offset(self.view.frame.size.width * 0.335);
        make.left.equalTo(self.view.mas_left).offset(self.view.frame.size.width * 0.63);
        make.top.equalTo(self.view.mas_top).offset(self.view.frame.size.height * 0.046);

    }];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[ViewTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_button];

    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_tableView.mas_right).offset(-28);
        //make.top.equalTo(_tableView.mas_top).offset(self.view.frame.size.height * 0.046 * 0.15);
        make.top.equalTo(_tableView.mas_top).offset(5);
        
        make.height.mas_offset(self.view.frame.size.height * 0.0495 * 0.68);
        make.width.mas_offset(self.view.frame.size.width * 0.335 * 0.22);
        
    }];
    [_button setImage:[UIImage imageNamed:@"shou"] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    
    _select = 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(_select == 0) {
        return 1;
    } else {
        return 5;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.iimageView.image = [UIImage imageNamed:_imageViewArr[indexPath.row]];
    cell.label.text = [NSString stringWithString:_labelArr[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *imageViewStr = [NSString stringWithString:_imageViewArr[indexPath.row]];
    NSString *labelStr = [NSString stringWithString:_labelArr[indexPath.row]];
    [_imageViewArr insertObject:imageViewStr atIndex:0];
    [_labelArr insertObject:labelStr atIndex:0];
    [_imageViewArr removeObjectAtIndex:indexPath.row + 1];
    [_labelArr removeObjectAtIndex:indexPath.row + 1];
    [_tableView reloadData];
    [self press];
    
}

- (void)press {
    if (_select == 0) {
        _select = 1;
        //_tableView.frame = CGRectMake(100, 100, 130, 200);
        [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_offset(200);
        }];

        [_button setImage:[UIImage imageNamed:@"kai"] forState:UIControlStateNormal];
        
    } else {
        _select = 0;
        //_tableView.frame = CGRectMake(100, 100, 130, 35);
        [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_offset(self.view.frame.size.height * 0.0485);
        }];

        [_button setImage:[UIImage imageNamed:@"shou"] forState:UIControlStateNormal];
    }
    [_tableView reloadData];
}

@end
