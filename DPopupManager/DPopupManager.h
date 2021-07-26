//
//  DPopupManager.h
//  DPopupManager
//
//  Created by wudan on 2021/7/26.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

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

@interface DPopupManager : NSObject
+ (instancetype)manager;

- (void)showPopupWithView:(UIView *)view viewSize:(CGSize)size;
- (void)showPopupWithView:(UIView *)view viewSize:(CGSize)size dismissHandler:(void(^)(void))handler;
- (void)showPopupWithView:(UIView *)view viewSize:(CGSize)size needBackTap:(BOOL)needBackTap;
- (void)showPopupWithView:(UIView *)view viewSize:(CGSize)size inView:(UIView * __nullable)parentView;
- (void)showPopupWithView:(UIView *)view viewSize:(CGSize)size inView:(UIView * __nullable)parentView needBackTap:(BOOL)needBackTap;
- (void)showPopupWithView:(UIView *)view viewSize:(CGSize)size inView:(UIView * __nullable)parentView needBackTap:(BOOL)needBackTap dismissHandler:(void(^)(void))handler;

/// 弹窗管理
/// @param view 需要显示的视图
/// @param size 显示视图大小
/// @param parentView 显示父类视图
/// @param needBackTap 是否需要背后
/// @param handler 点击背景，页面消失后回调
- (void)showPopupWithView:(UIView *)view
                 viewSize:(CGSize)size
                   inView:(UIView * __nullable)parentView
              needBackTap:(BOOL)needBackTap
        showAnimationType:(DPopupShowAnimationType)showAnimationType
     dismissAnimationType:(DPopupDismissAnimationType)dismissAnimationType
           dismissHandler:(void(^)(void))handler;

- (void)dismissTopView;
- (void)dismissViewWithLevel:(NSInteger)level;

@end

NS_ASSUME_NONNULL_END
