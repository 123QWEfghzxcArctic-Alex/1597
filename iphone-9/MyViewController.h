//
//  ViewController.h
//  iphone-9
//
//  Created by Александр Нефёдов on 01.04.18.
//  Copyright © 2018 Александр Нефёдов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstModel.h"
#import "SecondModel.h"
#import "ThirdModel.h"

@interface MyViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *usersArray;

@property (nonatomic, strong) NSArray *newsArray;

@property (nonatomic,strong) NSArray *groupArray;

@property (nonatomic, strong) NSDictionary *ollInfDictionary;

@property (strong, nonatomic) IBOutlet UITableView *table1;

@end

