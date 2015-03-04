//
//  HomeMsgViewCell.m
//  weibo
//
//  Created by weiwei.zhan on 14-12-19.
//  Copyright (c) 2014年 weiwei.zhan. All rights reserved.
//

#import "HomeMsgViewCell.h"

@interface HomeMsgViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *avatar;

@property (weak, nonatomic) IBOutlet UILabel *text;

@property (weak, nonatomic) IBOutlet UILabel *name;

@end

@implementation HomeMsgViewCell

-(void)initWithData:(NSString*)name theAvatar:(NSURL*)avatar theText:(NSString*)text {
    self.name.text = name;
    self.text.text = text;
    UIImage *avatarImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:avatar]];
    self.avatar.image = [self imageWithRoundedCornersSize:avatarImage.size.height/2
                                               usingImage:avatarImage];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UIImage *)imageWithRoundedCornersSize:(float)cornerRadius usingImage:(UIImage *)original
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:original];
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds
                                cornerRadius:cornerRadius] addClip];
    // Draw your image
    [original drawInRect:imageView.bounds];
    
    // Get the image, here setting the UIImageView image
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return imageView.image;
}

@end
