//
//  ViewController.m
//  DPopupManager
//
//  Created by wudan on 2021/7/26.
//

#import "ViewController.h"
#import "DPopupManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    

    {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        [[DPopupManager manager] showPopupWithView:view viewSize:CGSizeMake(300, 300) inView:nil];
    }
//
//    {
//        UIView *view = [[UIView alloc] init];
//        view.backgroundColor = [UIColor orangeColor];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [[DPopupManager manager] showPopupWithView:view viewSize:CGSizeMake(200, 200) inView:self.view needBackTap:YES dismissHandler:^{
//                NSLog(@"=============_++++++");
//            }];
//        });
//    }
//
//    {
//        UIButton *view = [[UIButton alloc] init];
//        view.backgroundColor = [UIColor redColor];
//        [view addTarget:self action:@selector(didTappedButton:) forControlEvents:UIControlEventTouchUpInside];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [[DPopupManager manager] showPopupWithView:view viewSize:CGSizeMake(100, 100) inView:self.view needBackTap:NO dismissHandler:^{
//                NSLog(@"=============");
//            }];
//        });
//    }
//
    {
        UIButton *view = [[UIButton alloc] init];
        view.backgroundColor = [UIColor greenColor];
        [view addTarget:self action:@selector(didTappedButton:) forControlEvents:UIControlEventTouchUpInside];
        [[DPopupManager manager] showPopupWithView:view
                                          viewSize:CGSizeMake(150, 150)
                                            inView:self.view
                                       needBackTap:YES
                                 showAnimationType:(DPopupShowAnimationCenterScale)
                              dismissAnimationType:(DPopupDismissAnimationCenterScale)
                                    dismissHandler:^{
            
            NSLog(@"弹窗消失");
        }];
        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [[DPopupManager manager] dismissTopView];
//        });
    }
}

- (void)didTappedButton:(id)sender {
    [[DPopupManager manager] dismissTopView];
}

@end
