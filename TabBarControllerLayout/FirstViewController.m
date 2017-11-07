//
//  FirstViewController.m
//  TabBarControllerLayout
//
//  Created by William Towe on 11/7/17.
//  Copyright © 2017 Broadsoft, Inc. All rights reserved.
//

#import "FirstViewController.h"
#import "TabBarController.h"

#import <Ditko/Ditko.h>

@interface FirstViewController ()
@property (strong,nonatomic) UITextView *textView;
@end

@implementation FirstViewController

- (NSString *)title {
    return @"First";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectZero textContainer:nil];
    self.textView.translatesAutoresizingMaskIntoConstraints = NO;
    self.textView.backgroundColor = KDIColorRandomRGB();
    self.textView.editable = NO;
    self.textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.textView.text = @"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";
    [self.view addSubview:self.textView];
    
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view": self.textView}]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{@"view": self.textView}]];
    
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(_addItemAction:)];
    UIBarButtonItem *removeItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(_removeItemAction:)];
    
    self.navigationItem.rightBarButtonItems = @[addItem,removeItem];
}

- (IBAction)_addItemAction:(id)sender {
    [NSNotificationCenter.defaultCenter postNotificationName:kAddStackViewArrangedView object:nil];
}
- (IBAction)_removeItemAction:(id)sender {
    [NSNotificationCenter.defaultCenter postNotificationName:kRemoveStackViewArrangedView object:nil];
}

@end
