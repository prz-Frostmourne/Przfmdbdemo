//
//  ViewController.m
//  Przfmdbdemo
//
//  Created by xiantian on 16/1/6.
//  Copyright © 2016年 xiantian. All rights reserved.
//

#import "ViewController.h"
#import "fmdbssqlite.h"
#import "PTableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)savebutton:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sqliteusermodel *contact = [[sqliteusermodel alloc]init];
        contact.username = self.nametext.text;
        contact.phone = self.phonetext.text;
        contact.idField = self.agetext.text;
        [fmdbssqlite insertData:contact];
        
        dispatch_async(dispatch_get_main_queue(), ^{
                    PTableViewController *vc =[[PTableViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }); 
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
