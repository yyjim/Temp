//
//  DetailViewController.m
//  MeetTheTeam
//
//  Created by Cathy Oun on 4/26/17.
//  Copyright © 2017 cathyoun. All rights reserved.
//

#import "DetailViewController.h"
#import "UIColor+CMBColor.h"
#import "UIImage+ImageFetcher.h"
#import "CMBBioView.h"

static const CGFloat kbioViewUpConstraint = 0;
static const CGFloat kbioViewDownConstraint = 260;

@interface DetailViewController ()

@property (strong, nonatomic) UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *bioView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bioViewVerticalConstraint;


@property (strong, nonatomic) CMBBioView *dragbleView;
@end

@implementation DetailViewController
{
    BOOL _isToggle;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = self.employee.firstName;
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = self.view.bounds;
    self.scrollView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    self.scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.scrollView];
    
    self.avatarImageView.frame = CGRectMake(0, 0, 100, 100);
    [self.avatarImageView.heightAnchor
     constraintEqualToAnchor:self.view.heightAnchor multiplier:0.5];
    [self.avatarImageView.widthAnchor
     constraintEqualToAnchor:self.view.widthAnchor multiplier:1];
    
    [self.bioView removeFromSuperview];
    
    self.scrollView.contentSize = CGSizeMake(375, 900);
    [self.scrollView addSubview:self.bioView];
    self.bioView.frame = CGRectMake(0, 260, 375, 667);
    
    self.dragbleView = [[CMBBioView alloc] initWithFrame:self.view.bounds];
    [self.bioView insertSubview:self.dragbleView atIndex:0];
    
    self.avatarImageView.image = self.employee.avatarImage;
    self.titleLabel.text = self.employee.title;
    self.nameLabel.text = [NSString stringWithFormat:@"%@ %@",
                           self.employee.firstName, self.employee.lastName];
    self.bioTextView.text = self.employee.bio;
    self.bioTextView.scrollEnabled = NO;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.bioView.frame = CGRectMake(0, 260,
                                    self.view.bounds.size.width,
                                    self.view.bounds.size.height);
}

@end
