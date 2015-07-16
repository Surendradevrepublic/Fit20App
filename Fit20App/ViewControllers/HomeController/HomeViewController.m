 //
//  ViewController.m
//  Fit20App
//
//  Created by surendra kunwar on 6/15/15.
//  Copyright (c) 2015 Devrepublic. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController
@synthesize tblList;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    indexTitles = [[NSMutableArray alloc] initWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z",nil];
    
    
    
    [self addBottomView];
    [self getStudioList];
}

-(void)getStudioList
{
    if (appDelegate.isNetworkAvailable) {
        
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
         //   NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"1", @"icon_type", nil];
            
        [WebService getRequestWithUrl:@"_ah/api/fit20/v1/studio" WithParameter:nil GetResponse:^(id response)
             {
                 if (response)
                 {
                     marrStudios = [[NSMutableArray alloc] init];
                     [marrStudios addObjectsFromArray:[response valueForKey:@"items"]];
                 }
                 
                 NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)];
                 
                 marrStudios = [[marrStudios sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]]copy];
                 marrSortedStudio = [marrStudios copy];
                 
                 [MBProgressHUD hideAllHUDsForView:self.view  animated:YES];
                 [tblList reloadData];
             }];
    }else{
        DisplayAlertWithTitle(APPNAME, @"No internetConnection!")
    }
}

-(void)addBottomView
{
    bottomView = [[[NSBundle mainBundle] loadNibNamed:@"BottomView" owner:self options:nil] objectAtIndex:0];
    [bottomView setFrame:CGRectMake(0, 703, 1024, 65)];
    [self.view addSubview:bottomView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark UITableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //+ marrStudios.count-(marrStudios.count/3)*3;
    // return (marrStudios.count)/3;
    
    float n = (float)(marrStudios.count)/3;
    
    float roundedup = ceil(n);
    return roundedup;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        ListCell *cell = (ListCell *)[tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
        
        if(cell == nil)
        {
            NSArray *arr;
            arr=[[NSBundle mainBundle] loadNibNamed:@"ListCell" owner:self options:nil];
            for (id idCell in arr)
            {
                if([idCell isKindOfClass:[UITableViewCell class]])
                {
                    cell=(ListCell *) idCell;
                    break;
                }
            }
        }
    
    tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    
    [tap1 setDelegate:self];
    [tap2 setDelegate:self];
    [tap3 setDelegate:self];
    
    cell.userInteractionEnabled = YES;
    
    int i=indexPath.row;
    
    NSDictionary *d1,*d2,*d3;
    i=i*3;
    
    if (i < marrStudios.count) {
    d1= [marrStudios objectAtIndex:i];
    cell.part1.hidden = NO;
        
    cell.v1.tag = i;
        
        tap1.view.tag = i;
        
        [cell.v1 addGestureRecognizer:tap1];
        
    cell.v1lblName.text = [NSString stringWithFormat:@"%@",[d1 valueForKey:@"name"]];
    cell.v1lblDetail.text = [NSString stringWithFormat:@"%@",[d1 valueForKey:@"email"]];
    cell.v1lblNameSubName.text = [NSString stringWithFormat:@"studio"];
    }
    
    i++;
    if (i < marrStudios.count) {
    d2 = [marrStudios objectAtIndex:i];
    cell.part2.hidden = NO;
        
    cell.v2.tag = i;
        
        tap2.view.tag = i;
        
        [cell.v2 addGestureRecognizer:tap2];
        
    cell.v2lblName.text = [NSString stringWithFormat:@"%@",[d2 valueForKey:@"name"]];
    cell.v2lblDetail.text = [NSString stringWithFormat:@"%@",[d2 valueForKey:@"email"]];
    cell.v2lblNameSubName.text = [NSString stringWithFormat:@"studio"];
    }
    
    i++;
    if (i < marrStudios.count) {
    d3 = [marrStudios objectAtIndex:i];
    cell.part3.hidden = NO;
        
    cell.v3.tag = i;
        
        tap3.view.tag = i;
        
        [cell.v3 addGestureRecognizer:tap3];
        
    cell.v3lblName.text = [NSString stringWithFormat:@"%@",[d3 valueForKey:@"name"]];
    cell.v3lblDetail.text = [NSString stringWithFormat:@"%@",[d3 valueForKey:@"email"]];
    cell.v3lblNameSubName.text = [NSString stringWithFormat:@"studio"];
    }
    
    return cell;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [indexTitles copy];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString*)title atIndex:(NSInteger)index {
    
    int foundIndex = 0;
    for (NSDictionary *obj in marrStudios) {
        if ([[[[obj valueForKey:@"name"] substringToIndex:1] uppercaseString] compare:title] == NSOrderedSame || [[[[obj valueForKey:@"name"] substringToIndex:1] uppercaseString] compare: title] == NSOrderedDescending)
            break;
        foundIndex++;
    }
    
    if(foundIndex >= [marrStudios count])
        foundIndex = [marrStudios count]-1;
    
    [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:foundIndex/3 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    return 1;
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    NSDictionary *dict = marrStudios[recognizer.view.tag];
    NSLog(@"NAME = %@",[dict valueForKey:@"name"]);
    
    mlvc = [storyboard instantiateViewControllerWithIdentifier:@"MemberListViewController"];
    [self.navigationController pushViewController:mlvc animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
