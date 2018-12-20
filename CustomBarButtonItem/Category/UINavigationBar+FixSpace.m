//
//  UINavigationBar+FixSpace.m
//  AF
//
//  Created by changshitong on 2018/12/10.
//  Copyright © 2018年 BookEdu. All rights reserved.
//

#import "UINavigationBar+FixSpace.h"
#import "NSObject+SXRuntime.h"

@implementation UINavigationBar (FixSpace)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceMethodWithOriginSel:@selector(layoutSubviews)
                                     swizzledSel:@selector(sx_layoutSubviews)];
    });
}

- (void)sx_layoutSubviews{
    [self sx_layoutSubviews];
    
    if (@available(iOS 11.0, *)) {
        self.layoutMargins = UIEdgeInsetsZero;
        CGFloat space = 0;
        for (UIView *subview in self.subviews) {
            if ([NSStringFromClass(subview.class) containsString:@"ContentView"]) {
                subview.layoutMargins = UIEdgeInsetsMake(0, space, 0, space);
                break;
            }
        }
    }
}

@end
