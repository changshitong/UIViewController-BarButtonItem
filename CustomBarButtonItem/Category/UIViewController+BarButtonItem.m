//
//  UIViewController+BarButtonItem.m
//  AF
//
//  Created by changshitong on 2018/12/7.
//  Copyright © 2018年 BookEdu. All rights reserved.
//

#import "UIViewController+BarButtonItem.h"
#import <Objc/runtime.h>

typedef NS_ENUM(NSUInteger, BarButtonItemPosition) {
    BarButtonItemPositionLeft,
    BarButtonItemPositionRight,
    BarButtonItemPositionCenter
};

@interface UIViewController ()
@property (nonatomic,copy) BarButtonItemActionBlock leftBarButtonItemActionBlock;
@property (nonatomic,copy) BarButtonItemActionBlock rightBarButtonItemActionBlock;
@end


@implementation UIViewController (BarButtonItem)

static void *leftBarButtonItemActionBlockKey = &leftBarButtonItemActionBlockKey;
static void *rightBarButtonItemActionBlockKey = &rightBarButtonItemActionBlockKey;

#pragma mark - set LeftBarButtonItem

- (void)setLeftBarButtonItemTitle:(NSString *)title actionBlock:(BarButtonItemActionBlock)actionBlock
{
    UIFont *font = [UIFont systemFontOfSize:18];
    UIColor *color = [UIColor blackColor];
    [self setLeftBarButtonItemTitle:title titleColor:color titleFont:font actionBlock:actionBlock];
}

- (void)setLeftBarButtonItemTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont actionBlock:(BarButtonItemActionBlock)actionBlock
{
    [self setLeftBarButtonItemImage:nil title:title titleColor:titleColor titleFont:titleFont actionBlock:actionBlock];
}

- (void)setLeftBarButtonItemImage:(UIImage *)image actionBlock:(BarButtonItemActionBlock)actionBlock
{
    [self setLeftBarButtonItemImage:image title:nil titleColor:nil titleFont:nil actionBlock:actionBlock];
}

- (void)setLeftBarButtonItemImage:(UIImage *)image title:(NSString *)title actionBlock:(BarButtonItemActionBlock)actionBlock
{
    [self setLeftBarButtonItemImage:image title:title titleColor:nil titleFont:nil actionBlock:actionBlock];
}

- (void)setLeftBarButtonItemImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont actionBlock:(BarButtonItemActionBlock)actionBlock
{
    [self setLeftBarButtonItemImage:image imageScaleModel:UIViewContentModeScaleAspectFit title:title titleColor:titleColor titleFont:titleFont actionBlock:actionBlock];
}

- (void)setLeftBarButtonItemImage:(UIImage *)image imageScaleModel:(UIViewContentMode)imageScaleModel title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont actionBlock:(BarButtonItemActionBlock)actionBlock
{
    [self setBarButtonItemImage:image imageScaleModel:imageScaleModel title:title titleColor:titleColor titleFont:titleFont position:BarButtonItemPositionLeft actionBlock:actionBlock];
}
#pragma mark - set RightBarButtonItem

- (void)setRightBarButtonItemTitle:(NSString *)title actionBlock:(BarButtonItemActionBlock)actionBlock
{
    UIFont *font = [UIFont systemFontOfSize:18];
    UIColor *color = [UIColor blackColor];
    [self setRightBarButtonItemTitle:title titleColor:color titleFont:font actionBlock:actionBlock];
}

- (void)setRightBarButtonItemTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont actionBlock:(BarButtonItemActionBlock)actionBlock
{
    [self setRightBarButtonItemImage:nil title:title titleColor:titleColor titleFont:titleFont actionBlock:actionBlock];
}

- (void)setRightBarButtonItemImage:(UIImage *)image actionBlock:(BarButtonItemActionBlock)actionBlock
{
    [self setRightBarButtonItemImage:image title:nil titleColor:nil titleFont:nil actionBlock:actionBlock];
}

- (void)setRightBarButtonItemImage:(UIImage *)image title:(NSString *)title actionBlock:(BarButtonItemActionBlock)actionBlock
{
    [self setRightBarButtonItemImage:image title:title titleColor:nil titleFont:nil actionBlock:actionBlock];
}

- (void)setRightBarButtonItemImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont actionBlock:(BarButtonItemActionBlock)actionBlock
{
    [self setRightBarButtonItemImage:image imageScaleModel:UIViewContentModeScaleAspectFit title:title titleColor:titleColor titleFont:titleFont actionBlock:actionBlock];
}

- (void)setRightBarButtonItemImage:(UIImage *)image imageScaleModel:(UIViewContentMode)imageScaleModel title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont actionBlock:(BarButtonItemActionBlock)actionBlock
{
    [self setBarButtonItemImage:image imageScaleModel:imageScaleModel title:title titleColor:titleColor titleFont:titleFont position:BarButtonItemPositionRight actionBlock:actionBlock];
}

#pragma mark - Base

- (void)setBarButtonItemImage:(UIImage *)image imageScaleModel:(UIViewContentMode)imageScaleModel title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont position:(BarButtonItemPosition)position actionBlock:(BarButtonItemActionBlock)actionBlock
{
    UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    itemButton.tag = 1;
    if (image) {
        [itemButton setImage:image forState:UIControlStateNormal];
        itemButton.imageView.contentMode = imageScaleModel;
    }
    
    if (title) {
        [itemButton setTitle:title forState:UIControlStateNormal];
        
        if (titleColor) {
            [itemButton setTitleColor:titleColor forState:UIControlStateNormal];
        }
        if (titleFont) {
            itemButton.titleLabel.font = titleFont;
        }
    }
    
    
    [itemButton sizeToFit];
    
    CGRect buttonFrame = itemButton.frame;
    buttonFrame.size.width += 32;
    buttonFrame.size.height = 44;
    itemButton.frame = buttonFrame;
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:itemButton];
    barButtonItem.tag = 1;
    UIBarButtonItem *fixSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixSpace.width = -16;
    
    switch (position) {
        case BarButtonItemPositionLeft: {
            self.leftBarButtonItemActionBlock = actionBlock;
            if (@available(iOS 11.0, *)) {
                self.navigationItem.leftBarButtonItems=@[barButtonItem];
            } else {
                self.navigationItem.leftBarButtonItems = @[fixSpace,barButtonItem];
            }
            [itemButton addTarget:self action:@selector(barButtonItem_leftBarButtonItemAction:) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
            
        case BarButtonItemPositionRight: {
            self.rightBarButtonItemActionBlock = actionBlock;
            self.navigationItem.rightBarButtonItems = @[fixSpace,barButtonItem];
            [itemButton addTarget:self action:@selector(barButtonItem_rightBarButtonItemAction:) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
        case BarButtonItemPositionCenter:
            break;
    }
}

#pragma mark - btn Action

- (void)barButtonItem_leftBarButtonItemAction:(UIButton *)itemButton
{
    if (self.leftBarButtonItemActionBlock) {
        self.leftBarButtonItemActionBlock(itemButton.tag);
    }
}

- (void)barButtonItem_rightBarButtonItemAction:(UIButton *)itemButton
{
    if (self.rightBarButtonItemActionBlock) {
        self.rightBarButtonItemActionBlock(itemButton.tag);
    }
}

#pragma mark - getter

- (BarButtonItemActionBlock)leftBarButtonItemActionBlock
{
    return objc_getAssociatedObject(self, leftBarButtonItemActionBlockKey);
}

- (BarButtonItemActionBlock)rightBarButtonItemActionBlock
{
    return objc_getAssociatedObject(self, rightBarButtonItemActionBlockKey);
}

#pragma mark - setter

- (void)setLeftBarButtonItemActionBlock:(BarButtonItemActionBlock)block
{
    objc_setAssociatedObject(self, leftBarButtonItemActionBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)setRightBarButtonItemActionBlock:(BarButtonItemActionBlock)block
{
    objc_setAssociatedObject(self, rightBarButtonItemActionBlockKey, block, OBJC_ASSOCIATION_COPY);
}

@end
