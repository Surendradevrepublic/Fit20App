//
//  customCell.m
//  ScheidingsApp
//
//  Created by surendra kunwar on 6/16/14.
//  Copyright (c) 2014 DevRepublic. All rights reserved.
//

#import "ListCell.h"

@implementation ListCell
@synthesize v1,v2,v3,v1lblStatus1,v1lblStatus2,v1lblStatus3,v2lblStatus1,v2lblStatus2,v2lblStatus3,v3lblStatus1,v3lblStatus2,v3lblStatus3;

- (void)awakeFromNib
{
    v1.layer.cornerRadius = 10;
    v2.layer.cornerRadius = 10;
    v3.layer.cornerRadius = 10;
    
    v1.backgroundColor = [UIColor colorWithRed:160.0/255 green:212.0/255 blue:103.0/255 alpha:1.0];
    v2.backgroundColor = [UIColor colorWithRed:160.0/255 green:212.0/255 blue:103.0/255 alpha:1.0];
    v3.backgroundColor = [UIColor colorWithRed:160.0/255 green:212.0/255 blue:103.0/255 alpha:1.0];
    
    v1lblStatus1.layer.cornerRadius = 5;
    v1lblStatus2.layer.cornerRadius = 5;
    v1lblStatus3.layer.cornerRadius = 5;
    
    v2lblStatus1.layer.cornerRadius = 5;
    v2lblStatus2.layer.cornerRadius = 5;
    v2lblStatus3.layer.cornerRadius = 5;
    
    v3lblStatus1.layer.cornerRadius = 5;
    v3lblStatus2.layer.cornerRadius = 5;
    v3lblStatus3.layer.cornerRadius = 5;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
