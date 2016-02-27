//
//  UIImage+TH_GIFImage.h
//  GiFHUD
//
//  Created by 谢小御 on 16/1/14.
//  Copyright © 2016年 Cem Olcay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LO_GIFImage)
+ (UIImage *)animatedImageWithAnimatedGIFData:(NSData *)data;
+ (UIImage *)animatedImageWithAnimatedGIFURL:(NSURL *)url;
+ (UIImage *)animatedImageWithAnimatedNSBundleAndGIFName:(NSString *)name;
@end
