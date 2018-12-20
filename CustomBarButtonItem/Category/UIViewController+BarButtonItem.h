//
//  UIViewController+BarButtonItem.h
//  AF
//
//  Created by changshitong on 2018/12/7.
//  Copyright © 2018年 BookEdu. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^BarButtonItemActionBlock)(NSInteger index);

@interface UIViewController (BarButtonItem)

///Set left item: title
- (void)setLeftBarButtonItemTitle:(NSString *)title actionBlock:(BarButtonItemActionBlock)actionBlock;

///Set left item: title titleColor titleFont
- (void)setLeftBarButtonItemTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont actionBlock:(BarButtonItemActionBlock)actionBlock;

///Set left item: image
- (void)setLeftBarButtonItemImage:(UIImage *)image actionBlock:(BarButtonItemActionBlock)actionBlock;

///Set left item: image title
- (void)setLeftBarButtonItemImage:(UIImage *)image title:(NSString *)title actionBlock:(BarButtonItemActionBlock)actionBlock;

///Set left item: image title titleColor titleFont
- (void)setLeftBarButtonItemImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont actionBlock:(BarButtonItemActionBlock)actionBlock;

///Set left item: image imageScaleMode title titleColor titleFont
- (void)setLeftBarButtonItemImage:(UIImage *)image imageScaleModel:(UIViewContentMode)imageScaleMode title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont actionBlock:(BarButtonItemActionBlock)actionBlock;



///Set right item: title
- (void)setRightBarButtonItemTitle:(NSString *)title actionBlock:(BarButtonItemActionBlock)actionBlock;

///Set right item: title titleColor titleFont
- (void)setRightBarButtonItemTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont actionBlock:(BarButtonItemActionBlock)actionBlock;

///Set right item: image
- (void)setRightBarButtonItemImage:(UIImage *)image actionBlock:(BarButtonItemActionBlock)actionBlock;

///Set right item: image title
- (void)setRightBarButtonItemImage:(UIImage *)image title:(NSString *)title actionBlock:(BarButtonItemActionBlock)actionBlock;

///Set right item: image title titleColor titleFont
- (void)setRightBarButtonItemImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont actionBlock:(BarButtonItemActionBlock)actionBlock;

///Set right item: image imageScaleMode title titleColor titleFont
- (void)setRightBarButtonItemImage:(UIImage *)image imageScaleModel:(UIViewContentMode)imageScaleModel title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont actionBlock:(BarButtonItemActionBlock)actionBlock;

@end

