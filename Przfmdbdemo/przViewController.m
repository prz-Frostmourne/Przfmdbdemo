//
//  przViewController.m
//  Przfmdbdemo
//
//  Created by xiantian on 16/1/7.
//  Copyright © 2016年 xiantian. All rights reserved.
//

#import "przViewController.h"

@interface przViewController (){
    
    sqliteusermodel *contacts;
}
@end

@implementation przViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        contacts = [fmdbssqlite queryoneData:self.contact];
        self.namelabel.text = contacts.username;
        self.phonename.text = contacts.phone;
        self.agelabel.text  = contacts.idField;
    });
}

@end
