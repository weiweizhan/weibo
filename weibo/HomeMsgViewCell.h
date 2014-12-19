//
//  HomeMsgViewCell.h
//  weibo
//
//  Created by weiwei.zhan on 14-12-19.
//  Copyright (c) 2014年 weiwei.zhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeMsgViewCell : UITableViewCell

-(void)initWithData:(NSString*)name theAvatar:(NSURL*)avatar theText:(NSString*)text;

@end
