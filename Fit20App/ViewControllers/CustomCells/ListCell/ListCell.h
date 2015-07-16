//
//  customCell.h
//  ScheidingsApp
//
//  Created by surendra kunwar on 6/16/14.
//  Copyright (c) 2014 DevRepublic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *v1, *v2, *v3;
@property (strong, nonatomic) IBOutlet UIView *part1, *part2, *part3;

@property (strong, nonatomic) IBOutlet UIImageView *v1ImgProfile, *v1ImgSubProfile;
@property (strong, nonatomic) IBOutlet UILabel *v1lblName, *v1lblDetail, *v1lblNameSubName;
@property (strong, nonatomic) IBOutlet UILabel *v1lblStatus1, *v1lblStatus2, *v1lblStatus3;

@property (strong, nonatomic) IBOutlet UIImageView *v2ImgProfile, *v2ImgSubProfile;
@property (strong, nonatomic) IBOutlet UILabel *v2lblName, *v2lblDetail, *v2lblNameSubName;
@property (strong, nonatomic) IBOutlet UILabel *v2lblStatus1, *v2lblStatus2, *v2lblStatus3;

@property (strong, nonatomic) IBOutlet UIImageView *v3ImgProfile, *v3ImgSubProfile;
@property (strong, nonatomic) IBOutlet UILabel *v3lblName, *v3lblDetail, *v3lblNameSubName;
@property (strong, nonatomic) IBOutlet UILabel *v3lblStatus1, *v3lblStatus2, *v3lblStatus3;

@end
