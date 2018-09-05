//
//  UIViewController+DeleteIconAlert.m
//  动态修改图标Swift
//
//  Created by guxiangyun on 2018/9/5.
//  Copyright © 2018年 chenran. All rights reserved.
//

#import "UIViewController+DeleteIconAlert.h"
#import <objc/runtime.h>

@implementation UIViewController (DeleteIconAlert)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method presentBefore = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
        Method presentAfter = class_getInstanceMethod(self.class, @selector(presentViewControllerWithoutIconAlert:animated:completion:));
        method_exchangeImplementations(presentBefore, presentAfter);
    });
}
- (void)presentViewControllerWithoutIconAlert:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
        UIAlertController *alertController = (UIAlertController *)viewControllerToPresent;
        if (alertController.title == nil && alertController.message == nil) {
            return;
        }
    }
    [self presentViewControllerWithoutIconAlert:viewControllerToPresent animated:flag completion:completion];
}

@end
