//
//  AppDelegate.h
//  DismissSample
//
//  Created by akuraru on 2016/12/30.
//  Copyright © 2016年 Ubiregi inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

