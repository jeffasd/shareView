//
//  ViewController.m
//  ShareViewDemo
//
//  Created by GJW on 16/8/8.
//  Copyright © 2016年 JW. All rights reserved.
//

#import "ViewController.h"
#import "JWShareView.h"

@interface ViewController ()
@property (nonatomic ,strong)UILabel *lable;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lable = [[UILabel alloc] initWithFrame:self.view.bounds];
    self.lable.textAlignment = NSTextAlignmentCenter;
    self.lable.text = @"点我";
    [self.view addSubview:self.lable];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSArray *contentArray = @[@{@"name":@"新浪微博",@"icon":@"sns_icon_3"},
                              @{@"name":@"QQ空间 ",@"icon":@"sns_icon_5"},
                              @{@"name":@"QQ",@"icon":@"sns_icon_4"},
                              @{@"name":@"微信",@"icon":@"sns_icon_7"},
                              @{@"name":@"朋友圈",@"icon":@"sns_icon_8"},
                              @{@"name":@"微信收藏",@"icon":@"sns_icon_9"}];
    /*
     *  不太完美
     *
    JWShareView *shareView = [[JWShareView alloc] init];
    
    [shareView addShareItems:self.view shareItems:contentArray selectShareItem:^(NSInteger tag, NSString *title) {
        NSLog(@"%ld --- %@", tag, title);
     
    }];
    
*/
    __weak ViewController *weakSelf = self;
    
    [[JWShareView shareView] addShareItems:self.view shareItems:contentArray selectShareItem:^(NSInteger tag, NSString *title) {
        
        switch (tag) {
            case 0://新浪微博
                weakSelf.lable.text = @"你要上天啊,这么黄，新浪";
                weakSelf.view.backgroundColor = [UIColor yellowColor];
                
                break;
                
            case 1://QQ空间
                weakSelf.lable.text = @"你要上天啊,空间这么黄";
                weakSelf.view.backgroundColor = [UIColor brownColor];
             
                break;
                
            case 2://QQ
                weakSelf.lable.text = @"你要上天啊,这么Q";
                weakSelf.view.backgroundColor = [UIColor darkGrayColor];
               
                break;
            case 3://微信
                weakSelf.lable.text = @"你要上天啊,还玩微信";
                weakSelf.view.backgroundColor = [UIColor blueColor];
               
                break;
                
            case 4://朋友圈
                weakSelf.lable.text = @"你要上天啊,还发朋友圈";
                weakSelf.view.backgroundColor = [UIColor redColor];
                
                break;
                
            case 5://微信收藏
                weakSelf.lable.text = @"你要上天啊,还搞微信收藏";
                weakSelf.view.backgroundColor = [UIColor cyanColor];
                
                break;
            
            default:
                break;
        }
        //点击取消分享视图
        [[JWShareView shareView] cancleButtonAction];
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
