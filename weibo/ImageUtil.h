//
//  ImageUtil.h
//  weibo
//
//  Created by weiwei.zhan on 15-3-4.
//  Copyright (c) 2015年 weiwei.zhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ImageUtil : NSObject

+ (UIImage *)imageWithRoundedCornersSize:(float)cornerRadius usingImage:(UIImage *)original;

@end
