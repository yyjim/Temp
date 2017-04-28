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
#import <Masonry/Masonry.h>

static const CGFloat kbioViewUpConstraint = 0;
static const CGFloat kbioViewDownConstraint = 260;

@interface DetailViewController ()

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
    self.avatarImageView.image = self.employee.avatarImage;
    self.titleLabel.text = self.employee.title;
    self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", self.employee.firstName, self.employee.lastName];
    self.bioTextView.text = self.employee.bio;
    self.bioTextView.scrollEnabled = NO;
    [self setupDrawDiagonal];
}

- (void)setupDrawDiagonal
{
    self.dragbleView = [[CMBBioView alloc] initWithFrame:self.view.frame];
    [self.bioView insertSubview:self.dragbleView belowSubview:self.bioTextView];
    [self.bioView insertSubview:self.dragbleView belowSubview:self.nameLabel];
    [self.bioView insertSubview:self.dragbleView belowSubview:self.titleLabel];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(handlePanGesture:)];
    [self.dragbleView addGestureRecognizer:pan];
}



- (void)handlePanGesture:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:recognizer.view];
    NSLog(@"%f,%f",translation.x, translation.y);
    
    CGFloat progress = translation.y / kbioViewDownConstraint;
    NSLog(@"%f",progress);
    progress = MAX(MIN(1, progress), 0);
    
    self.bioViewVerticalConstraint.constant = progress * kbioViewDownConstraint;
}
//    if (progress > 0.02) {
//        self.bioViewVerticalConstraint.constant = 260;
//    } else {
//        self.bioViewVerticalConstraint.constant = 0;
//    }
//    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        [self.view layoutIfNeeded];
//    } completion:nil];
//    
    
//    switch (recognizer.state) {
//        case UIGestureRecognizerStateBegan:
//            break;
//        case UIGestureRecognizerStateChanged:
//            NSLog(@"progress: %f",progress);
//
//            [self.view layoutIfNeeded];
//            break;
//        case UIGestureRecognizerStateEnded:
//
//            break;
//        default:
//            break;
//    }
//}



@end
