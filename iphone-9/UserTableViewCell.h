//
//  UserTableViewCell.h
//  iphone-9
//
//  Created by Александр Нефёдов on 03.04.18.
//  Copyright © 2018 Александр Нефёдов. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelNameInModelUser;

@property (weak, nonatomic) IBOutlet UIImageView *imageInModelUser;

@end
