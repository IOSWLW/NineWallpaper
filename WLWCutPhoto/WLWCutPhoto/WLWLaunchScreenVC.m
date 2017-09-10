//
//  WLWLaunchScreenVC.m
//  WLWCutPhoto
//
//  Created by 汪理伟 on 2017/9/9.
//  Copyright © 2017年 汪理伟. All rights reserved.
//

#import "WLWLaunchScreenVC.h"
#import "FBShimmeringView.h"
#import "HUTransitionAnimator.h"
#import "WLWNetImageVC.h"
#import <JHChainableAnimations/JHChainableAnimations.h>

@interface WLWLaunchScreenVC () <UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet FBShimmeringView *shimmeringView;
@property (weak, nonatomic) IBOutlet UIImageView *LogoView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *loagTopLayout;

@end

@implementation WLWLaunchScreenVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UILabel *logoLabel = [[UILabel alloc] initWithFrame:_shimmeringView.bounds];
    logoLabel.text = @"Shimmer";
    logoLabel.font = [UIFont fontWithName:@"Zapfino" size:25];
    logoLabel.textColor = [UIColor whiteColor];
    logoLabel.textAlignment = NSTextAlignmentCenter;
    logoLabel.backgroundColor = [UIColor clearColor];
    logoLabel.textAlignment = NSTextAlignmentCenter;
    logoLabel.text = NSLocalizedString(@"WELLCOME⑨", nil);
    _shimmeringView.contentView = logoLabel;
    _shimmeringView.shimmering = YES;
    _shimmeringView.shimmeringBeginFadeDuration = 0.2;
    _shimmeringView.shimmeringOpacity = 0.2;
    _shimmeringView.shimmeringAnimationOpacity = 0.7;
    self.navigationController.delegate = self;
    [self animationLogo];
    [self pushToMainVC];
}

- (void)animationLogo {
    _loagTopLayout.active = NO;
    JHChainableAnimator *animator = [[JHChainableAnimator alloc] initWithView:self.LogoView];
    animator.moveY(258).spring.thenAfter(2.0).bounce.animate(4);
}

- (void)pushToMainVC {
    WLWNetImageVC *netImageVC = [[WLWNetImageVC alloc] init];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView transitionWithView:[UIApplication sharedApplication].keyWindow duration:0.2 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [self.navigationController pushViewController:netImageVC animated:YES];
        } completion:nil];
    });
}

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{

    HUTransitionVerticalLinesAnimator *animator = [[HUTransitionVerticalLinesAnimator alloc] init];
    [animator setPresenting:(operation == UINavigationControllerOperationPush)];
    return animator;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
