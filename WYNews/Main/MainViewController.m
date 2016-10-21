//
//  MainViewController.m
//  WYNews
//
//  Created by 姚乐 on 16/10/21.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import "MainViewController.h"
#import "NewsTableViewController.h"
#import "TitleLabel.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *smallScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *bigScrollVIew;
@property (nonatomic,strong)NSArray* dataArray;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;

    [self addNewsPage];
    [self addTitleLabel];
    [self loadFirstPage];
}

/*
 首次加载页面
 */
-(void)loadFirstPage {
    NewsTableViewController* vc = self.childViewControllers[0];
    vc.view.frame = self.bigScrollVIew.bounds;
    [self.bigScrollVIew addSubview:self.childViewControllers[0].view];
}

-(void)addTitleLabel {
    self.smallScrollView.showsHorizontalScrollIndicator = NO;
    self.smallScrollView.scrollsToTop = NO;
    
    /*
     设置标签长宽
     */
    NSInteger count = self.dataArray.count;
    CGFloat labWidth = 70;
    CGFloat labheight = 40;
    
    for (int i = 0; i < count; i++) {
        NewsTableViewController* vc = self.childViewControllers[i];
        CGRect labframe = CGRectMake(labWidth * i, 0, labWidth, labheight);
        TitleLabel* lab = [[TitleLabel alloc]initWithFrame:labframe];
        lab.text = vc.title;
        [self.smallScrollView addSubview:lab];
    }
    [self.smallScrollView setContentSize:CGSizeMake(labWidth * count, labheight)];
}

-(void)addNewsPage {
    NSInteger count = self.dataArray.count;
    YaoLog(@"%ld",count);
    for (int i = 0; i < count; i++) {
        NewsTableViewController* vc = [[UIStoryboard storyboardWithName:@"NewsTableview" bundle:nil]instantiateInitialViewController];
        [self addChildViewController:vc];
        vc.title = self.dataArray[i][@"title"];
    }
    
    /*
     设置多个新闻列表区域的frame;
     */
    self.bigScrollVIew.contentSize = CGSizeMake(count * self.view.width, 0);
    self.bigScrollVIew.pagingEnabled = YES;
    self.bigScrollVIew.showsHorizontalScrollIndicator = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - lazyLoad
-(NSArray *)dataArray {
    if (_dataArray == nil) {
        self.dataArray  = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"NewsURLs.plist" ofType:nil ]];
    }
    return _dataArray;
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
