//
//  GroupTableViewCell.h
//  iphone-9
//
//  Created by Александр Нефёдов on 03.04.18.
//  Copyright © 2018 Александр Нефёдов. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelTitleInModelGroup;

@property (weak, nonatomic) IBOutlet UILabel *labelDescrInModelGroup;

@property (weak, nonatomic) IBOutlet UILabel *labelCountInModelGroup;

@end
