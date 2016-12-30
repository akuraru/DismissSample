//
//  ViewController.m
//  DismissSample
//
//  Created by akuraru on 2016/12/30.
//  Copyright © 2016年 Ubiregi inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) NSInteger count;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger count = 1;
    UIViewController *viewController = self;
    while (viewController.presentingViewController) {
        viewController = viewController.presentingViewController;
        count++;
    }
    self.count = count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.count;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return true;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSString *text = [NSString stringWithFormat:@"index %zd", indexPath.row];
    cell.textLabel.text = (indexPath.row != self.count - 1) ? text : [text stringByAppendingString:@" (Self)"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = self;
    for (NSInteger repeat = 0; repeat < self.count - 1 - indexPath.row; repeat++) {
        viewController = viewController.presentingViewController;
    }
    [viewController dismissViewControllerAnimated:YES completion:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    __weak UIViewController *viewController = self;
    for (NSInteger repeat = 0; repeat < self.count - 1 - indexPath.row; repeat++) {
        viewController = viewController.presentingViewController;
    }
    if (viewController.presentingViewController) {
        [viewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    } else {
        [viewController dismissViewControllerAnimated:YES completion:nil];
    }
    if (!self.presentingViewController) {
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end
