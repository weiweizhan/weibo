//
//  WeiboMessage.h
//  weibo
//
//  Created by weiwei.zhan on 14-12-19.
//  Copyright (c) 2014年 weiwei.zhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeiboMsg : NSObject

@property NSString *name;
@property NSString *text;
@property NSURL *avatar;

@end

@interface WeiboMessage : NSObject

-(NSMutableArray*)getMsgs;

@end
