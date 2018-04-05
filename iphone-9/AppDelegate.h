//
//  AppDelegate.h
//  iphone-9
//
//  Created by Александр Нефёдов on 01.04.18.
//  Copyright © 2018 Александр Нефёдов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

