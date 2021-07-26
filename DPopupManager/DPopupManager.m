//
//  DPopupManager.m
//  DPopupManager
//
//  Created by wudan on 2021/7/26.
//

#import "DPopupManager.h"

typedef void(^DismissHandler)(void);

@interface DPopupManagerModel : NSObject
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) UIView *onView;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, copy) DismissHandler dismissHandler;
@property (nonatomic, assign) BOOL needBackTap;
@property (nonatomic, assign) DPopupShowAnimationType showAnimationType;
@property (nonatomic, assign) DPopupDismissAnimationType dismissAnimationType;
@end

@implementation DPopupManagerModel

@end

@interface DPopupManager ()
@property (nonatomic, strong) UIButton *backTransparentButton;
@property (nonatomic, strong) NSMutableArray<DPopupManagerModel *> *currentViewArray;
@end

@implementation DPopupManager

+ (instancetype)manager {
    static dispatch_once_t onceToken;
    static DPopupManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (void)didTappedBackTransparentButtonActionEvent:(id)sender {
    DPopupManagerModel *topModel = self.currentViewArray.lastObject;
    if (!topModel.needBackTap) {return;}
    [self dismissTopView];
}

- (void)dismissTopView {
    if (self.currentViewArray.count == 0) {return;}
    
    DPopupManagerModel *topModel = self.currentViewArray.lastObject;
    
    [UIView animateWithDuration:0.35 animations:^{
        if (topModel.dismissAnimationType == DPopupDismissAnimationCenterScale) {
            topModel.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        } else if (topModel.dismissAnimationType == DPopupDismissAnimationFromTop) {
            topModel.view.center = CGPointMake(self.backTransparentButton.center.x, self.backTransparentButton.center.y - UIScreen.mainScreen.bounds.size.height);
        } else if (topModel.dismissAnimationType == DPopupDismissAnimationFromBottom) {
            topModel.view.center = CGPointMake(self.backTransparentButton.center.x, self.backTransparentButton.center.y + UIScreen.mainScreen.bounds.size.height);
        } else {
            topModel.view.alpha = 0;
        }
        if (self.currentViewArray.count == 1) {
            self.backTransparentButton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.0];
        }
    } completion:^(BOOL finished) {
        [topModel.view removeFromSuperview];
        if (self.currentViewArray.count == 1) {
            [self.backTransparentButton removeFromSuperview];
        }
        
        if (topModel.dismissHandler) {
            topModel.dismissHandler();
        }
        [self.currentViewArray removeLastObject];
    }];
}

- (void)dismissViewWithLevel:(NSInteger)level {
    if (self.currentViewArray.count == 0) {return;}
    if (level >= self.currentViewArray.count) {return;}
    
    DPopupManagerModel *topModel = self.currentViewArray[level];
    
    [UIView animateWithDuration:0.35 animations:^{
        if (topModel.dismissAnimationType == DPopupDismissAnimationCenterScale) {
            topModel.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        } else if (topModel.dismissAnimationType == DPopupDismissAnimationFromTop) {
            topModel.view.center = CGPointMake(self.backTransparentButton.center.x, self.backTransparentButton.center.y - UIScreen.mainScreen.bounds.size.height);
        } else if (topModel.dismissAnimationType == DPopupDismissAnimationFromBottom) {
            topModel.view.center = CGPointMake(self.backTransparentButton.center.x, self.backTransparentButton.center.y + UIScreen.mainScreen.bounds.size.height);
        } else {
            topModel.view.alpha = 0;
        }
        
        if (self.currentViewArray.count == 1) {
            self.backTransparentButton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.0];
        }
    } completion:^(BOOL finished) {
        [topModel.view removeFromSuperview];
        if (self.currentViewArray.count == 1) {
            [self.backTransparentButton removeFromSuperview];
        }
        [self.currentViewArray removeLastObject];
    }];
}


- (void)showPopupWithView:(UIView *)view viewSize:(CGSize)size {
    [self showPopupWithView:view viewSize:size inView:nil needBackTap:YES showAnimationType:(DPopupShowAnimationCenterScale) dismissAnimationType:(DPopupDismissAnimationCenterScale) dismissHandler:^{
        
    }];
}

- (void)showPopupWithView:(UIView *)view viewSize:(CGSize)size dismissHandler:(void(^)(void))handler {
    [self showPopupWithView:view viewSize:size inView:nil needBackTap:YES showAnimationType:(DPopupShowAnimationCenterScale) dismissAnimationType:(DPopupDismissAnimationCenterScale) dismissHandler:handler];
}

- (void)showPopupWithView:(UIView *)view viewSize:(CGSize)size needBackTap:(BOOL)needBackTap {
    [self showPopupWithView:view viewSize:size inView:nil needBackTap:needBackTap showAnimationType:(DPopupShowAnimationCenterScale) dismissAnimationType:(DPopupDismissAnimationCenterScale) dismissHandler:^{
        
    }];
}

- (void)showPopupWithView:(UIView *)view viewSize:(CGSize)size inView:(UIView * __nullable)parentView {
    [self showPopupWithView:view viewSize:size inView:parentView needBackTap:YES showAnimationType:(DPopupShowAnimationCenterScale) dismissAnimationType:(DPopupDismissAnimationCenterScale) dismissHandler:^{
        
    }];
}

- (void)showPopupWithView:(UIView *)view viewSize:(CGSize)size inView:(UIView * __nullable)parentView needBackTap:(BOOL)needBackTap {
    [self showPopupWithView:view viewSize:size inView:parentView needBackTap:needBackTap showAnimationType:(DPopupShowAnimationCenterScale) dismissAnimationType:(DPopupDismissAnimationCenterScale) dismissHandler:^{
        
    }];
}

- (void)showPopupWithView:(UIView *)view viewSize:(CGSize)size inView:(UIView * __nullable)parentView needBackTap:(BOOL)needBackTap dismissHandler:(void(^)(void))handler {
    [self showPopupWithView:view viewSize:size inView:parentView needBackTap:needBackTap showAnimationType:(DPopupShowAnimationCenterScale) dismissAnimationType:(DPopupDismissAnimationCenterScale) dismissHandler:handler];
}

- (void)showPopupWithView:(UIView *)view
                 viewSize:(CGSize)size
                   inView:(UIView * __nullable)parentView
              needBackTap:(BOOL)needBackTap
        showAnimationType:(DPopupShowAnimationType)showAnimationType
     dismissAnimationType:(DPopupDismissAnimationType)dismissAnimationType
           dismissHandler:(void(^)(void))handler {
    
    UIView *onParentView = [UIApplication sharedApplication].keyWindow;
    if (onParentView == nil) {
        onParentView = [UIApplication sharedApplication].delegate.window;
        if (onParentView == nil) {
            onParentView = [UIApplication sharedApplication].windows.firstObject;
        }
    }

    if (parentView) {
        onParentView = parentView;
    }

    DPopupManagerModel *model = [[DPopupManagerModel alloc] init];
    model.view = view;
    model.onView = onParentView;
    model.size = size;
    model.needBackTap = needBackTap;
    model.dismissHandler = handler;
    model.showAnimationType = showAnimationType;
    model.dismissAnimationType = dismissAnimationType;
    [self.currentViewArray addObject:model];

    [onParentView addSubview:self.backTransparentButton];
    [self.backTransparentButton addSubview:view];
    
    if (showAnimationType == DPopupShowAnimationCenterScale) {
        view.center = self.backTransparentButton.center;
        view.bounds = CGRectMake(0, 0, size.width, size.height);
        view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        [UIView animateWithDuration:0.35 animations:^{
            self.backTransparentButton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
            view.transform = CGAffineTransformIdentity;
        }];
    } else if (showAnimationType == DPopupShowAnimationFromTop) {
        view.center = CGPointMake(self.backTransparentButton.center.x, self.backTransparentButton.center.y - UIScreen.mainScreen.bounds.size.height);
        view.bounds = CGRectMake(0, 0, size.width, size.height);
        [UIView animateWithDuration:0.35 animations:^{
            self.backTransparentButton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
            view.center = self.backTransparentButton.center;
        }];
    } else {
        view.center = CGPointMake(self.backTransparentButton.center.x, self.backTransparentButton.center.y + UIScreen.mainScreen.bounds.size.height);
        view.bounds = CGRectMake(0, 0, size.width, size.height);
        [UIView animateWithDuration:0.35 animations:^{
            self.backTransparentButton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
            view.center = self.backTransparentButton.center;
        }];
    }
}

- (UIButton *)backTransparentButton {
    if (!_backTransparentButton) {
        _backTransparentButton = [[UIButton alloc] initWithFrame:UIScreen.mainScreen.bounds];
        _backTransparentButton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.0];
        [_backTransparentButton addTarget:self action:@selector(didTappedBackTransparentButtonActionEvent:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backTransparentButton;
}

- (NSMutableArray<DPopupManagerModel *> *)currentViewArray {
    if (!_currentViewArray) {
        _currentViewArray = [NSMutableArray array];
    }
    return _currentViewArray;
}

@end
