//
//  CollectionViewVC.m
//  LCXListViewKit
//
//  Created by lcx on 2020/2/26.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "CollectionViewVC.h"
#import <LCXListViewKit.h>
#import "CollectionViewCell.h"
#import "CellModel.h"

#define UIScreen_Width [UIScreen mainScreen].bounds.size.width

@interface CollectionViewVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UILabel *headLab;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation CollectionViewVC

- (void)dealloc
{
    NSLog(@"dealloc %@",self.class);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = NSStringFromClass(self.class);
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 横向items的间距
    flowLayout.minimumLineSpacing = 5;
    // 纵向items的间距
    flowLayout.minimumInteritemSpacing = 5;
    // 所有item的size
    flowLayout.itemSize = CGSizeMake((UIScreen_Width-10*2-5)/2, 90);
    // 定义每个UICollectionView分区外边距（上左下右）
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);

    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.headLab.bounds.size.height, UIScreen_Width, 480) collectionViewLayout:flowLayout];
    //self.view.bounds.size.width
    [self.view addSubview:collectionView];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor orangeColor];
    [collectionView registerClass:CollectionViewCell.class forCellWithReuseIdentifier:@"cellID"];
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

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID = @"cellID";
    __weak typeof(self) weakSelf = self;
    UICollectionViewCell *cell = [collectionView lcx_reuseCellID:cellID forIndexPath:indexPath cellActionHandle:^(NSIndexPath * _Nonnull actionCellIndexPath, NSInteger cellActionIndex) {
        
                weakSelf.headLab.text = [NSString stringWithFormat:@"section = %li,row = %li, cellActionIndex = %li",(long)actionCellIndexPath.section,(long)actionCellIndexPath.row,(long)cellActionIndex];
        
    }];
    ((LCXSuperCollectionViewCell *)cell).cellModel = self.dataSource[indexPath.row];

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
