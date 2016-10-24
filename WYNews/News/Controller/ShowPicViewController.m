//
//  ShowPicViewController.m
//  WYNews
//
//  Created by 姚乐 on 16/10/24.
//  Copyright © 2016年 yaole. All rights reserved.
//

#import "ShowPicViewController.h"
#import "NetworkTool.h"
#import "PhotoModel.h"
#import "PhotoSetModel.h"

@interface ShowPicViewController ()
@property (nonatomic,strong)PhotoSetModel* PhotoSetModel;
@property (nonatomic,strong)UIScrollView* scrollView;

@end

@implementation ShowPicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //@"http://c.m.163.com/photo/api/set/0001/2206996.json";
    NSArray* arr = [[self.model.photosetID substringFromIndex:4] componentsSeparatedByString:@"|"];
    NSString* url = [NSString stringWithFormat:@"http://c.m.163.com/photo/api/set/%@/%@.json",arr[0],arr[1]];
    [[NetworkTool sharedTool]GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.PhotoSetModel = [PhotoSetModel photoSetWithDict:responseObject];
        NSArray* photoArr = responseObject[@"photos"];
        NSMutableArray* tempArr = [NSMutableArray array];
        for (NSDictionary* dict in photoArr) {
            PhotoModel* photoModel = [PhotoModel photoWithDict:dict];
            [tempArr addObject:photoModel];
        }
        self.PhotoSetModel.photos = tempArr;
        [self setupScrollView];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
}

-(void)setupScrollView {
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.frame;
    scrollView.backgroundColor = [UIColor blackColor];
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width*self.PhotoSetModel.photos.count, 0);
    scrollView.pagingEnabled = YES;
    for (NSInteger i = 0; i<self.PhotoSetModel.photos.count; i++) {
        PhotoModel *photoModel = self.PhotoSetModel.photos[i];
        UIImageView *imageView =[[UIImageView alloc] init];
        imageView.frame = CGRectMake(i*scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [imageView sd_setImageWithURL:[NSURL URLWithString:photoModel.imgurl]];
        [scrollView addSubview:imageView];
        
        UITextView* noteLable = [[UITextView alloc]init];
        noteLable.frame = CGRectMake(i*scrollView.frame.size.width, [UIScreen mainScreen].bounds.size.height *0.7, self.view.frame.size.width, [UIScreen mainScreen].bounds.size.height *0.25);
        noteLable.text = photoModel.note;
        noteLable.textColor = [UIColor whiteColor];
        noteLable.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
        noteLable.userInteractionEnabled = NO;
        [scrollView addSubview:noteLable];
        [scrollView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImage)]];
        
    }
    
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;

}

-(void)clickImage {
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UITextView class]]) {
            obj.hidden = !obj.hidden;
        }
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
