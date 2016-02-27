//
//  TH_GifHudView.h
//  GiFHUD
//
//  Created by 谢小御 on 16/1/22.
//  Copyright © 2016年 Cem Olcay. All rights reserved.
//

#import <UIKit/UIKit.h>
#define LO_GifHudViewLayerAlpha 0.5
@interface LO_GifHudView : UIView
+ (void)setLO_GifWithImageName:(NSString *)imageName;
+ (void)show;
+ (void)stop;
@end
