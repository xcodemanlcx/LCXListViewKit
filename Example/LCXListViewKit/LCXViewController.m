//
//  LCXViewController.m
//  LCXListViewKit
//
//  Created by 475512103@qq.com on 02/27/2020.
//  Copyright (c) 2020 475512103@qq.com. All rights reserved.
//

#import "LCXViewController.h"
#import "TableViewVC.h"
#import "CollectionViewVC.h"

@interface LCXViewController ()

@end

@implementation LCXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)tableViewAction:(id)sender {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:TableViewVC.new];
    nav.navigationBar.translucent = NO;
    [self presentViewController:nav animated:YES completion:nil];
}

- (IBAction)collectionViewAction:(id)sender {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:CollectionViewVC.new];
    nav.navigationBar.translucent = NO;
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
