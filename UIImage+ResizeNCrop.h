//
//  UIImage-ResizeNCrop.h
//  UIImage-ResizeNCrop
//
//  Created by Yann BONAFONS on 15/12/2014.
//
//

#import <Foundation/Foundation.h>

@interface UIImage (ResizeNCrop)

- (UIImage *) customResize:(CGSize)size inside:(BOOL)inside;
- (UIImage *) cropInRect:(CGRect) rect;
- (UIImage *)resizeImageAtSize:(CGSize)newSize;

@end
