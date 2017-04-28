//
//  EmployeeCell.m
//  MeetTheTeam
//
//  Created by Cathy Oun on 4/26/17.
//  Copyright © 2017 cathyoun. All rights reserved.
//

#import "EmployeeCell.h"
#import "UIImage+ImageFetcher.h"
#import "UIColor+CMBColor.h"

static const CGFloat kAvatarImageViewHeight = 70;
@interface EmployeeCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation EmployeeCell

- (void)setEmployee:(Employee *)employee
{
    _employee = employee;
    self.nameLabel.text = [NSString stringWithFormat: @"%@ %@", self.employee.firstName, self.employee.lastName];
    self.titleLabel.text = self.employee.title;
    [self.avatarImageView.layer setBorderColor: [[UIColor primaryColor] CGColor]];
    [self.avatarImageView.layer setBorderWidth: 3.0];
    // If the image hasn't been downloaded, download it and save it to the model object.
    if (employee.avatarImage == nil) {
        [UIImage fetchImageWith:self.employee.avatarStringURL completionHandler:^(UIImage *image) {
            self.avatarImageView.image = image;
            _employee.avatarImage = image;
            [self.activityIndicator stopAnimating];
        }];
    } else {
        self.avatarImageView.image = self.employee.avatarImage;
    }

}

-(void)prepareForReuse
{
    [super prepareForReuse];
    self.nameLabel.text = @"";
    self.titleLabel.text = @"";
    self.avatarImageView.image = nil;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.avatarImageView.layer.cornerRadius = kAvatarImageViewHeight / 2;
    self.avatarImageView.layer.masksToBounds = YES;
    [self.activityIndicator startAnimating];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
