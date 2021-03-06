//
//  HomeMsgViewCell.m
//  weibo
//
//  Created by weiwei.zhan on 14-12-19.
//  Copyright (c) 2014年 weiwei.zhan. All rights reserved.
//

#import "HomeMsgViewCell.h"
#import "ImageUtil.h"

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
    self.avatar.image = [ImageUtil imageWithRoundedCornersSize:avatarImage.size.height/2
                                               usingImage:avatarImage];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
