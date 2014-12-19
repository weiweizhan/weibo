//
//  HomeTableViewController.m
//  weibo
//
//  Created by weiwei.zhan on 14-12-19.
//  Copyright (c) 2014年 weiwei.zhan. All rights reserved.
//

#import "HomeTableViewController.h"
#import "WeiboMessage.h"

@interface HomeTableViewController ()

@end

@implementation HomeTableViewController{
    NSMutableArray *msgs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WeiboMessage *msg = [[WeiboMessage alloc] init];
    msgs = [msg getMsgs];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [msgs count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    WeiboMsg *msg = [msgs objectAtIndex:[indexPath row]];
    cell.textLabel.text = msg.text;
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:msg.avatar]];
    return cell;
}

@end
