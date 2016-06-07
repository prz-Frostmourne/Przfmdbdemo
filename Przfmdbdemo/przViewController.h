//
//  przViewController.h
//  Przfmdbdemo
//
//  Created by xiantian on 16/1/7.
//  Copyright © 2016年 xiantian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "fmdbssqlite.h"
#import "sqliteusermodel.h"
@interface przViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *namelabel;
@property (weak, nonatomic) IBOutlet UILabel *agelabel;
@property (weak, nonatomic) IBOutlet UILabel *phonename;


@property (nonatomic,retain) sqliteusermodel *contact;
@end
