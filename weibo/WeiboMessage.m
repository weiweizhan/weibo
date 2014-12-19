//
//  WeiboMessage.m
//  weibo
//
//  Created by weiwei.zhan on 14-12-19.
//  Copyright (c) 2014年 weiwei.zhan. All rights reserved.
//

#import "WeiboMessage.h"

@implementation WeiboMsg

@end



@interface WeiboMessage()

@property NSMutableArray *msgs;

@end

@implementation WeiboMessage {
    NSString *accessToken;
}

-(id)init {
    self = [super init];
    accessToken = @"2.00XoPdmBkdWh2Cabdb08329dx3GzuD";
    self.msgs = [[NSMutableArray alloc] init];
    return self;
}

- (void)getMsgData {
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/2/statuses/public_timeline.json?access_token=2.00XoPdmBkdWh2Cabdb08329dx3GzuD"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5];
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *msgs = [[NSString alloc] initWithData:received encoding:NSUTF8StringEncoding];
    
    NSData *data = [msgs dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSArray *status = [dict objectForKey:@"statuses"];
    [self extractMsg:status];
}

-(void)extractMsg:(NSArray*)status {
    for (NSInteger i = 0, cnt = [status count]; i <cnt; ++i) {
        NSDictionary *msg = [status objectAtIndex:i];
        WeiboMsg *weiboMsg = [[WeiboMsg alloc] init];
        weiboMsg.text = [msg objectForKey:@"text"];
        NSDictionary *user = [msg objectForKey:@"user"];
        weiboMsg.avatar = [NSURL URLWithString:[user objectForKey:@"profile_image_url"]];
        weiboMsg.name = [user objectForKey:@"name"];
        [self.msgs addObject:weiboMsg];
    }
}

-(NSMutableArray*)getMsgs {
    [self getMsgData];
    return self.msgs;
}

@end
