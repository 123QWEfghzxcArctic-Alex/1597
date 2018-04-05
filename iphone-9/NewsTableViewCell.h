//
//  NewsTableViewCell.h
//  iphone-9
//
//  Created by Александр Нефёдов on 03.04.18.
//  Copyright © 2018 Александр Нефёдов. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelDateInModelNews;

@property (weak, nonatomic) IBOutlet UILabel *labelTitleInModelNews;

@property (weak, nonatomic) IBOutlet UILabel *labelDiscInModelNews;

@end
