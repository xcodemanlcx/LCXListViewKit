//
//  TableViewVC.m
//  LCXListViewKit
//
//  Created by lcx on 2020/2/26.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "TableViewVC.h"
#import <LCXListViewKit.h>
#import "CellModel.h"
#import "TableViewCell.h"

@interface TableViewVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UILabel *headLab;

@end

@implementation TableViewVC

- (void)dealloc
{
    NSLog(@"dealloc %@",self.class);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = NSStringFromClass(self.class);
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.headLab.bounds.size.height, self.view.bounds.size.width, 480) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    [_tableView registerClass:TableViewCell.class forCellReuseIdentifier:@"cellID"];
}

- (UILabel *)headLab{
    if (!_headLab) {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
        [self.view addSubview:lab];
        lab.font = [UIFont systemFontOfSize:20];
        lab.textColor = [UIColor redColor];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.text = @"点击cell的button后，显示选中元素标记";
        _headLab = lab;
    }
    return _headLab;
}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = @[].mutableCopy;
        for (int i = 0; i < 20; i++) {
            CellModel *model = CellModel.new;
            model.title = @(i).stringValue;
            [_dataSource addObject:model];
        }
    }
    return _dataSource;
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    __weak typeof(self) weakSelf = self;
    UITableViewCell *cell = [tableView lcx_reuseCellID:cellID cellActionHandle:^(NSIndexPath * _Nonnull actionCellIndexPath, NSInteger cellActionIndex) {
        weakSelf.headLab.text = [NSString stringWithFormat:@"section = %li,row = %li, cellActionIndex = %li",(long)actionCellIndexPath.section,(long)actionCellIndexPath.row,(long)cellActionIndex];
    }];
    ((LCXSuperTableViewCell *)cell).cellModel = self.dataSource[indexPath.row];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
