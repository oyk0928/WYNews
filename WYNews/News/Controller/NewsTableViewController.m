//
//  NewsTableViewController.m
//  WYNews
//
//  Created by 姚乐 on 16/10/21.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsModel.h"
#import "NetworkTool.h"
#import "NewsCell.h"
#import "CellFrameModel.h"
#import "NewsDetailViewController.h"
#import "ShowPicViewController.h"

@interface NewsTableViewController ()//<UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray<CellFrameModel*>* dataArray;
@property (nonatomic,strong)NetworkTool* tool;


@end

@implementation NewsTableViewController

-(NSMutableArray<CellFrameModel *> *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadMore];
    }];
    
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.dataArray.count == 0) {
        [self.tableView.mj_header beginRefreshing];
    }
}


/*
 初次加载和下拉刷新
 */
-(void)loadData {
    self.tool = [NetworkTool sharedTool];
    [_tool loadNewsFrom:@"0" withType:_urlString success:^(NSArray *modelArr) {
        self.dataArray = [NSMutableArray array];
        [self.tableView.mj_header endRefreshing];
        [modelArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CellFrameModel* frameModel = [[CellFrameModel alloc]init];
            frameModel.model = obj;
            [self.dataArray addObject:frameModel];
        }];
        YaoLog(@"加载完毕");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failure:^{
        nil;
    }];

}


/*
 实现上拉加载
 */
-(void)loadMore {
    [self.tableView.mj_footer endRefreshing];
    NSString* from = [NSString stringWithFormat:@"%d",[self.dataArray count]];
    [self.tool loadNewsFrom:from withType:self.urlString success:^(NSArray *modelArr) {
        [modelArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CellFrameModel* frameModel = [[CellFrameModel alloc]init];
            frameModel.model = obj;
            [self.dataArray addObject:frameModel];
        }];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failure:^{
        nil;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.dataArray.count) return 1;
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.dataArray.count) return self.dataArray.count;
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellFrameModel* model = self.dataArray[indexPath.row];
    
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:model.identifier forIndexPath:indexPath];
    
    cell.model = model.model;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataArray.count == 0) {
        return 0;
    }
    CellFrameModel* model = self.dataArray[indexPath.row];
    return model.cellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CellFrameModel* frameModel = self.dataArray[indexPath.row];
    
    /*
     用代码代理实现显示画册;
     */
    if ([frameModel.identifier isEqualToString:@"TopImageCell"] || [frameModel.identifier isEqualToString:@"ImagesCell"]) {
        ShowPicViewController* vc =[[ShowPicViewController alloc]init];
        vc.model = frameModel.model;
        [self.navigationController pushViewController:vc animated:YES];
    }
}


/*
 用segue方法显示新闻
 */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NewsDetailViewController* vc = segue.destinationViewController;
    NSInteger select = self.tableView.indexPathForSelectedRow.row;
    vc.model = self.dataArray[select].model;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
