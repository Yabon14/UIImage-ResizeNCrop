//
//  UIImage-ResizeNCrop.m
//  UIImage-ResizeNCrop
//
//  Created by Yann BONAFONS on 15/12/2014.
//
//

#import "UIImage+ResizeNCrop.h"

@implementation UIImage (ResizeNCrop)

-(UIImage*) customResize:(CGSize)size inside:(BOOL)inside {
    
    CGFloat widthRatio = self.size.width / size.width;
    CGFloat heightRatio = self.size.height / size.height;
    
    CGFloat ratio = inside ? widthRatio : heightRatio;
    CGFloat newWidth = size.width * ratio;
    CGFloat newHeight = size.height * ratio;
    
    CGRect cropRect = CGRectMake(self.size.width * 0.5f - newWidth * 0.5f, self.size.height * 0.5f - newHeight * 0.5f, newWidth, newHeight);
    
    UIImage* returnImage;
    UIImage* croppedImage = [self cropInRect:cropRect];
    returnImage = [croppedImage resizeImageAtSize:size];
    return returnImage;
}


-(UIImage*) cropInRect:(CGRect) rect {
    UIGraphicsBeginImageContextWithOptions(rect.size, false, [self scale]);
    CGPoint drawPoint = CGPointMake(-rect.origin.x, -rect.origin.y);
    [self drawAtPoint:drawPoint];
    UIImage* croppedIMage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return croppedIMage;
}


- (UIImage *)resizeImageAtSize:(CGSize)newSize {
    CGRect newRect = CGRectIntegral(CGRectMake(0, 0, newSize.width, newSize.height));
    CGImageRef imageRef = self.CGImage;
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Set the quality level to use when rescaling
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    CGAffineTransform flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, newSize.height);
    
    CGContextConcatCTM(context, flipVertical);
    // Draw into the context; this scales the image
    CGContextDrawImage(context, newRect, imageRef);
    
    // Get the resized image from the context and a UIImage
    CGImageRef newImageRef = CGBitmapContextCreateImage(context);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    CGImageRelease(newImageRef);
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
