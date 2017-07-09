//
//  ViewController.m
//  LearnASDemo
//
//  Created by hejintao on 2017/7/4.
//  Copyright © 2017年 hither. All rights reserved.
//

#import "ViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "HJTReadPageLastNode.h"
#import "ReadPageLastNode.h"
@interface ViewController ()<ASTableDataSource, ASTableDelegate>

@property (nonatomic,strong) ASTableNode *mainTableNode;

@end

@implementation ViewController

-(ASTableNode *)mainTableNode{
    if (!_mainTableNode) {
        _mainTableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
        _mainTableNode.frame = self.view.bounds;
        _mainTableNode.delegate = self;
        _mainTableNode.dataSource = self;
        
//        _mainTableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _mainTableNode;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubnode:self.mainTableNode];
    
    
}

#pragma mark -ASTableDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==3) {
        ASCellNode *(^readPageLastBlock)() = ^ASCellNode *(){
            ReadPageLastNode *cellNode = [[ReadPageLastNode alloc]init];
            return cellNode;
        };
        return readPageLastBlock;
    }
    
    ASCellNode *(^cellNodeBlock)() = ^ASCellNode *() {
        HJTReadPageLastNode *cellNode = [[HJTReadPageLastNode alloc] init];
        return cellNode;
    };
    
    return cellNodeBlock;
}

@end
