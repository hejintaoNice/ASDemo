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
#import <MJRefresh.h>
@interface ViewController ()<ASTableDataSource, ASTableDelegate>

@property (nonatomic,strong) ASTableNode *mainTableNode;
@property(strong,nonatomic)NSMutableArray* models;

@property (nonatomic,assign) NSInteger currentPage;
@property (nonatomic,assign) NSInteger pageSize;
@property (nonatomic,assign) NSInteger maxRows;

@end

@implementation ViewController

-(ASTableNode *)mainTableNode{
    if (!_mainTableNode) {
        _mainTableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
        _mainTableNode.frame = self.view.bounds;
        _mainTableNode.delegate = self;
        _mainTableNode.dataSource = self;
        _mainTableNode.view.leadingScreensForBatching = 1.0;
//        _mainTableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _mainTableNode;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _models= [NSMutableArray array];
    _currentPage = 0;
    _pageSize = 10;
    _maxRows = 82;
    self.view.backgroundColor = [UIColor whiteColor];
    [self configModels];
    [self.view addSubnode:self.mainTableNode];
    [self configRefresh];
}

-(void)configModels{
    NSArray *array = @[@"1",@"2",@"3",@"1",@"2",@"3",@"1",@"2",@"3",@"4"];
    [_models addObject:array];
}

-(void)configRefresh{
    __weak __typeof(self) weakSelf= self;
    self.mainTableNode.view.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self.mainTableNode.view.mj_header endRefreshing];
        self.currentPage = 0;
        [_models removeAllObjects];
        if(![self hasMoreData]){// 无数据显示
            self.mainTableNode.view.mj_footer.state = MJRefreshStateNoMoreData;
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.mainTableNode reloadData];
            });
        }
    }];
    
    
    self.mainTableNode.view.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        if(![self hasMoreData]){// 无数据显示
            self.mainTableNode.view.mj_footer.state = MJRefreshStateNoMoreData;
        }else{
            [self.mainTableNode.view.mj_footer endRefreshing];
        }
        
    }];
}

-(void)dealloc{
    self.mainTableNode.delegate = nil;
    self.mainTableNode.dataSource = nil;
}


#pragma mark -ASTableDataSource
- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (NSInteger)numberOfSectionsInTableNode:(ASTableNode *)tableNode{
    return 1;
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

#pragma mark -- configData
//这个方法返回一个 Bool 值，用于告诉 tableNode 是否需要批抓取
-(BOOL)shouldBatchFetchForTableNode:(ASTableNode *)tableNode{
   return [self hasMoreData];
}

- (void)tableNode:(ASTableNode *)tableNode willBeginBatchFetchWithContext:(ASBatchContext *)context
{
    [context beginBatchFetching];
    [self loadPageWithContext:context];
}

-(BOOL)hasMoreData{
    NSArray* nextPage = [self loadNextBatchData];
    return nextPage.count > 0 ;
}

//一般这里写网络请求
-(NSArray*)loadNextBatchData{
    
    NSMutableArray* array=[NSMutableArray new];
    
    for(NSInteger i = _models.count ;i< self.maxRows && i< _models.count+ self.pageSize;i++){
        NSString *str = [NSString stringWithFormat:@"第%ld行",i];
        [array addObject:str];
        NSLog(@"%@",str);
        
    }
    return array;
}

//批量加载
- (void)loadPageWithContext:(ASBatchContext *)context
{
    // 判断是否真的有新数据
    if([self hasMoreData]){
        NSArray *array= [self loadNextBatchData];
        [_models addObjectsFromArray:array];
        self.currentPage ++;
        // 新数据添加到表格的尾部
        [self insertNewRowsInTableNode:array];
        //通知ASDK批量加载完毕  改进行相关的绘制了
        [context completeBatchFetching:YES];
    }
}


- (void)insertNewRowsInTableNode:(NSArray*)array
{
    NSInteger section = 0;
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (NSUInteger row = _models.count-array.count; row < _models.count; row++) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:section];
        [indexPaths addObject:path];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mainTableNode insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    });
    
}

@end
