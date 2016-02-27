//
//  TH_GifHudView.m
//  GiFHUD
//
//  Created by 谢小御 on 16/1/22.
//  Copyright © 2016年 Olcay. All rights reserved.
//

#import "LO_GifHudView.h"
#import "UIImage+LO_GIFImage.h"
#define LO_APPDELEGATE ([[UIApplication sharedApplication] delegate])
#define LO_SHARDSELF [LO_GifHudView shardLO_GifHudView]
@interface LO_GifHudView ()
@property (nonatomic, strong) UIView *overlayView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) BOOL isShow;
@end
@implementation LO_GifHudView

+(instancetype)shardLO_GifHudView {
    static LO_GifHudView *GifHudView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        GifHudView = [LO_GifHudView new];
    });
    return GifHudView;
}
- (instancetype)init {
    CGFloat selfwith = [UIScreen mainScreen].bounds.size.width * 0.333;
    if ((self = [super initWithFrame:CGRectMake(0, 0, selfwith, selfwith)])) {
        [self setAlpha:0];
        [self setCenter:LO_APPDELEGATE.window.center];
        [self setClipsToBounds:NO];
        [self.layer setBackgroundColor:[[UIColor colorWithWhite:0 alpha:LO_GifHudViewLayerAlpha] CGColor]];
        [self.layer setCornerRadius:8];
        [self.layer setMasksToBounds:YES];
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectInset(self.bounds, 20, 20)];
        [self addSubview:self.imageView];
        self.isShow = NO;
    }
    return self;
}
- (UIView *)overlayView{
    if (!_overlayView) {
        _overlayView = [[UIView alloc] initWithFrame:LO_APPDELEGATE.window.frame];
        [_overlayView setBackgroundColor:[UIColor blackColor]];
        [_overlayView setAlpha:0];
        [UIView animateWithDuration:0.3 animations:^{
            [_overlayView setAlpha:0.3];
        }];
    }
    return _overlayView;
}
+ (void)show{
    LO_SHARDSELF.isShow = YES;
    [LO_APPDELEGATE.window addSubview:LO_SHARDSELF.overlayView];
    [LO_APPDELEGATE.window addSubview:LO_SHARDSELF];
    [LO_SHARDSELF.imageView startAnimating];
    [UIView animateWithDuration:0.3 animations:^{
        [LO_SHARDSELF setAlpha:1];
    }];
} 
+ (void)stop{
    if (!LO_SHARDSELF.isShow) {
        return;
    }
    [UIView animateWithDuration:0.3 animations:^{
        [LO_SHARDSELF setAlpha:0];
    } completion:^(BOOL finished) {
        [LO_SHARDSELF.imageView stopAnimating];
        [LO_SHARDSELF removeFromSuperview];
        [LO_SHARDSELF.overlayView removeFromSuperview];
        LO_SHARDSELF.isShow = NO;
    }];
}
+ (void)setLO_GifWithImageName:(NSString *)imageName{
    [LO_SHARDSELF.imageView stopAnimating];
    LO_SHARDSELF.imageView.image = [UIImage animatedImageWithAnimatedNSBundleAndGIFName:imageName];
}
@end
