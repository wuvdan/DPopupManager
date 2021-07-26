#  DPopupManager
统一弹窗管理器，提供基础弹窗功能，支持一次性多个弹窗一起弹出。

使用方式：
```
[[DPopupManager manager] showPopupWithView:view
                                  viewSize:CGSizeMake(150, 150)
                                    inView:self.view
                               needBackTap:YES
                         showAnimationType:(DPopupShowAnimationCenterScale)
                      dismissAnimationType:(DPopupDismissAnimationCenterScale)
                            dismissHandler:^{
    
    NSLog(@"弹窗消失");
}];
```

其他简约使用方法：
```
- (void)showPopupWithView:(UIView *)view viewSize:(CGSize)size;
- (void)showPopupWithView:(UIView *)view viewSize:(CGSize)size dismissHandler:(void(^)(void))handler;
- (void)showPopupWithView:(UIView *)view viewSize:(CGSize)size needBackTap:(BOOL)needBackTap;
- (void)showPopupWithView:(UIView *)view viewSize:(CGSize)size inView:(UIView * __nullable)parentView;
- (void)showPopupWithView:(UIView *)view viewSize:(CGSize)size inView:(UIView * __nullable)parentView needBackTap:(BOOL)needBackTap;
- (void)showPopupWithView:(UIView *)view viewSize:(CGSize)size inView:(UIView * __nullable)parentView needBackTap:(BOOL)needBackTap dismissHandler:(void(^)(void))handler;
```

主动消失
```
- (void)dismissTopView;
- (void)dismissViewWithLevel:(NSInteger)level;
```
目前支持动画
```
typedef NS_ENUM(NSUInteger, DPopupShowAnimationType) {
    DPopupShowAnimationCenterScale = 0,
    DPopupShowAnimationFromBottom,
    DPopupShowAnimationFromTop,
};

typedef NS_ENUM(NSUInteger, DPopupDismissAnimationType) {
    DPopupDismissAnimationCenterScale = 0,
    DPopupDismissAnimationNone,
    DPopupDismissAnimationFromBottom,
    DPopupDismissAnimationFromTop,
};
```
