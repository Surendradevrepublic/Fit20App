//
//  ViewController.h
//  Fit20App
//
//  Created by surendra kunwar on 6/15/15.
//  Copyright (c) 2015 Devrepublic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BottomView.h"
#import "ListCell.h"
#import "WebService.h"
#import "MBProgressHUD.h"
#import "MemberListViewController.h"

@interface HomeViewController : UIViewController <UIGestureRecognizerDelegate>
{
    BottomView  *bottomView;
    NSMutableArray *marrStudios, *indexTitles, *marrSortedStudio;
    UITapGestureRecognizer *tap1, *tap2, *tap3;
    MemberListViewController *mlvc;
}

@property (nonatomic, retain) IBOutlet UITableView *tblList;
@end

