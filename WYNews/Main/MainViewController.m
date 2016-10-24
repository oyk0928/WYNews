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

@interface MainViewController ()<UIScrollViewDelegate>
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
    self.smallScrollView.userInteractionEnabled = YES;
    
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
        lab.tag = i;
        lab.scale = 0;
        if (i == 0) {
            lab.scale = 1;
        }
        lab.userInteractionEnabled = YES;
        [lab addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labClick:)]];
        [self.smallScrollView addSubview:lab];
    }
    [self.smallScrollView setContentSize:CGSizeMake(labWidth * count, labheight)];
}

-(void)labClick:(UITapGestureRecognizer *)recognizer {
    TitleLabel* lab = recognizer.view;
    NSInteger index = lab.tag;
    YaoLog(@"%ld",index);
    CGFloat offsetX = index* self.bigScrollVIew.frame.size.width;
    
    CGFloat offsetY = self.bigScrollVIew.contentOffset.y;
    CGPoint offset = CGPointMake(offsetX, offsetY);
    [self.bigScrollVIew setContentOffset:offset animated:YES];
    
}

-(void)addNewsPage {
    NSInteger count = self.dataArray.count;
    YaoLog(@"%ld",count);
    for (int i = 0; i < count; i++) {
        NewsTableViewController* vc = [[UIStoryboard storyboardWithName:@"NewsTableview" bundle:nil]instantiateInitialViewController];
        [self addChildViewController:vc];
        vc.title = self.dataArray[i][@"title"];
        vc.urlString = self.dataArray[i][@"urlString"];
    }
    
    /*
     设置多个新闻列表区域的frame;
     */
    self.bigScrollVIew.contentSize = CGSizeMake(count * self.view.width, 0);
    self.bigScrollVIew.pagingEnabled = YES;
    self.bigScrollVIew.showsHorizontalScrollIndicator = NO;
    self.bigScrollVIew.delegate = self;


}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat value = scrollView.contentOffset.x / scrollView.frame.size.width;
    NSInteger indexLeft = (int)value;
    NSInteger indexRight = indexLeft + 1;
    TitleLabel* labLeft = self.smallScrollView.subviews[indexLeft];
    CGFloat scaleLeft = 1 - value + (CGFloat)indexLeft;
    labLeft.scale = scaleLeft;
    if (indexRight <= self.dataArray.count) {
        TitleLabel* labRight = [self.smallScrollView viewWithTag:indexRight];
        labRight.scale = (CGFloat)(value - indexLeft);
    }
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.bigScrollVIew ) {
        NSInteger index =  scrollView.contentOffset.x / scrollView.frame.size.width;
        [self scrollViewDidEndScrollingAnimation:self.bigScrollVIew];
    }

}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    if (scrollView == self.bigScrollVIew ) {
        NSInteger index =  scrollView.contentOffset.x / scrollView.frame.size.width;
        NewsTableViewController* vc = self.childViewControllers[index];
        vc.view.frame = self.view.frame;
        vc.view.x = index * self.view.width;
        YaoLog(@"%0.f,%0.f,%0.f,%0.f",vc.view.frame.origin.x,vc.view.frame.origin.y,vc.view.frame.size.width,vc.view.frame.size.height);
        [self.bigScrollVIew addSubview:vc.view];
        
        /*
         调整标签条位置
         */
        CGFloat offsetX = self.smallScrollView.subviews[index].center.x - self.view.frame.size.width /2;
        CGFloat offsetY = self.smallScrollView.contentOffset.y;
        if (offsetX<0) {offsetX = 0;}
        if (offsetX>self.smallScrollView.contentSize.width - self.smallScrollView.frame.size.width) {
            offsetX =self.smallScrollView.contentSize.width - self.smallScrollView.frame.size.width;
        }
        CGPoint offset = CGPointMake(offsetX, offsetY);
        [self.smallScrollView setContentOffset:offset animated:YES];
        
        for (int i=0; i<self.bigScrollVIew.subviews.count; i++) {
            UITableView* tableView = self.bigScrollVIew.subviews[i];
            NSInteger indexC =  tableView.frame.origin.x / scrollView.frame.size.width;
            if (abs(indexC-index)>2) {
                if ([tableView isKindOfClass:[UITableView class]]) {
                    [tableView removeFromSuperview];
                    NSLog(@"%d,%d",indexC,index);
                }
            }
        }
    }
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
