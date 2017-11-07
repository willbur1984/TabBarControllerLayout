//
//  TabBarController.m
//  TabBarControllerLayout
//
//  Created by William Towe on 11/7/17.
//  Copyright © 2017 Broadsoft, Inc. All rights reserved.
//

#import "TabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

#import <Ditko/Ditko.h>
#import <Quicksilver/Quicksilver.h>

NSNotificationName const kAddStackViewArrangedView = @"kAddStackViewArrangedView";
NSNotificationName const kRemoveStackViewArrangedView = @"kRemoveStackViewArrangedView";

@interface ArrangedView : UIView
@end

@implementation ArrangedView
- (instancetype)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame]))
        return nil;
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.backgroundColor = KDIColorRandomRGB();
    
    return self;
}
- (CGSize)intrinsicContentSize {
    return CGSizeMake(UIViewNoIntrinsicMetric, 44.0);
}
@end

@interface SimpleVerticalStackView : UIView
@property (strong,nonatomic) NSMutableArray *arrangedSubviews;
@property (copy,nonatomic) NSArray<NSLayoutConstraint *> *activeConstraints;

- (void)addArrangedSubview:(UIView *)arrangedSubview;
- (void)removeArrangedSubview:(UIView *)arrangedSubview;
@end

@implementation SimpleVerticalStackView
- (instancetype)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame]))
        return nil;
    
    _arrangedSubviews = [[NSMutableArray alloc] init];
    
    return self;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}
- (void)updateConstraints {
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    
    __block UIView *subview = nil;
    
    [self.arrangedSubviews KQS_each:^(UIView * _Nonnull object, NSInteger index) {
        [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view": object}]];
        
        if (self.arrangedSubviews.count == 1) {
            [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{@"view": object}]];
        }
        else {
            if (index == 0) {
                [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]" options:0 metrics:nil views:@{@"view": object}]];
            }
            else if (index == self.arrangedSubviews.count - 1) {
                [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[subview][view]|" options:0 metrics:nil views:@{@"view": object, @"subview": subview}]];
            }
            else {
                [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[subview][view]" options:0 metrics:nil views:@{@"view": object, @"subview": subview}]];
            }
        }
        
        subview = object;
    }];
    
    self.activeConstraints = constraints;
    
    [super updateConstraints];
}

- (void)addArrangedSubview:(UIView *)arrangedSubview; {
    [self.arrangedSubviews addObject:arrangedSubview];
    [self addSubview:arrangedSubview];
    
    [self setNeedsUpdateConstraints];
}
- (void)removeArrangedSubview:(UIView *)arrangedSubview; {
    [self.arrangedSubviews removeObject:arrangedSubview];
    [arrangedSubview removeFromSuperview];
    
    [self setNeedsUpdateConstraints];
}

- (void)setActiveConstraints:(NSArray<NSLayoutConstraint *> *)activeConstraints {
    [NSLayoutConstraint deactivateConstraints:_activeConstraints];
    
    _activeConstraints = activeConstraints;
    
    [NSLayoutConstraint activateConstraints:_activeConstraints];
}
@end

@interface TabBarController ()
@property (strong,nonatomic) SimpleVerticalStackView *stackView;
@end

@implementation TabBarController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (!(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
        return nil;
    
    self.viewControllers = @[[[UINavigationController alloc] initWithRootViewController:[[FirstViewController alloc] initWithNibName:nil bundle:nil]],
                             [[UINavigationController alloc] initWithRootViewController:[[SecondViewController alloc] initWithNibName:nil bundle:nil]]];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(_addNotification:) name:kAddStackViewArrangedView object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(_removeNotification:) name:kRemoveStackViewArrangedView object:nil];
    
    self.stackView = [[SimpleVerticalStackView alloc] initWithFrame:CGRectZero];
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.stackView];
    
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view": self.stackView}]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view][subview]" options:0 metrics:nil views:@{@"view": self.stackView, @"subview": self.tabBar}]];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.selectedViewController.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - CGRectGetHeight(self.stackView.frame));
}

- (void)_addNotification:(NSNotification *)note {
    [self.stackView addArrangedSubview:[[ArrangedView alloc] initWithFrame:CGRectZero]];
}
- (void)_removeNotification:(NSNotification *)note {
    [self.stackView removeArrangedSubview:self.stackView.arrangedSubviews.firstObject];
}

@end
