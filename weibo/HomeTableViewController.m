//
//  HomeTableViewController.m
//  weibo
//
//  Created by weiwei.zhan on 14-12-19.
//  Copyright (c) 2014年 weiwei.zhan. All rights reserved.
//

#import "HomeTableViewController.h"
#import "WeiboMessage.h"
#import "HomeMsgViewCell.h"

#define HOME_MSG_CELL_HEIGHT 120

@interface HomeTableViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *refresh;

@end

@implementation HomeTableViewController{
    NSMutableArray *msgs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WeiboMessage *msg = [[WeiboMessage alloc] init];
    msgs = [msg getMsgs];
}

- (IBAction)refresh:(id)sender {
    WeiboMessage *msg = [[WeiboMessage alloc] init];
    msgs = [msg getMsgs];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [msgs count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return HOME_MSG_CELL_HEIGHT;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeiboMsg *msg = [msgs objectAtIndex:[indexPath row]];
    NSString *name = msg.name;
    NSURL *avatar = msg.avatar;
    NSString *text = msg.text;
    HomeMsgViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeMsgViewCell"];
    if (cell == nil) {
        NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"HomeMsgViewCell" owner:self options:nil];
        cell = [arr objectAtIndex:0];
    }
    [cell initWithData:name theAvatar:avatar theText:text];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

@end
