//
//  ViewController.m
//  iphone-9
//
//  Created by Александр Нефёдов on 01.04.18.
//  Copyright © 2018 Александр Нефёдов. All rights reserved.
//

#import "MyViewController.h"
#import "FirstModel.h"
#import "SecondModel.h"
#import "ThirdModel.h"
#import "UserTableViewCell.h"
#import "GroupTableViewCell.h"
#import "NewsTableViewCell.h"

NSString *globalString =@"";

@interface MyViewController ()

@end

@implementation MyViewController

@synthesize usersArray;
@synthesize newsArray;
@synthesize groupArray;
@synthesize ollInfDictionary;
@synthesize table1;

- (void)viewDidLoad {
    [super viewDidLoad];
        
    //созание элементов массивов
    FirstModel *fioModel1 = [FirstModel new];
    FirstModel *fioModel2 = [FirstModel new];
    FirstModel *fioModel3 = [FirstModel new];
    
    SecondModel *newsMadel1 = [SecondModel new];
    SecondModel *newsModel2 = [SecondModel new];
    SecondModel *newsModel3 = [SecondModel new];
    SecondModel *newsModel4 = [SecondModel new];
    
    ThirdModel *groupModel1 = [ThirdModel new];
    ThirdModel *groupModel2 = [ThirdModel new];
    
    //
    fioModel1.ferstName = @"Маша";
    fioModel1.lastName = @"Степанова";
    fioModel1.iconName = [UIImage imageNamed:@"pic.jpg"];
    
    fioModel2.ferstName = @"Миша";
    fioModel2.lastName = @"Степанов";
    fioModel2.iconName = [UIImage imageNamed:@"pic2.jpg"];

    fioModel3.ferstName = @"Витя";
    fioModel3.lastName = @"Фролов";
    fioModel3.iconName = [UIImage imageNamed:@"pic3.jpg"];

    //
//    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
//    NSString *stringDate = [dateFormatter stringFromDate:[NSDate date]];
    //
    newsMadel1.titleSecondModel = @"Заголовок 1";
    newsMadel1.descSecondModel = @"Описание 1";
    newsMadel1.dateSecondModel = [NSDate date];

    newsModel2.titleSecondModel = @"Заголовок 2";
    newsModel2.descSecondModel = @"Описание 2";
    newsModel2.dateSecondModel = [NSDate date];
    
    newsModel3.titleSecondModel = @"Заголовок 3";
    newsModel3.descSecondModel = @"Описание 3";
    newsModel3.dateSecondModel = [NSDate date];

    newsModel4.titleSecondModel = @"Заголовок 4";
    newsModel4.descSecondModel = @"Описание 4";
    newsModel4.dateSecondModel = [NSDate date];

    //
    groupModel1.titleThirdModel = @"Заголовок 5";
    groupModel1.descThirdModel = @"Описание 5";
//    groupModel1.countThirdModel = ;
    
    groupModel2.titleThirdModel = @"Заголовок 6";
    groupModel2.descThirdModel = @"Описание 6";
    //    groupModel2.countThirdModel = ;
    
    
    //заполнение массивов
    self.usersArray = [[NSArray alloc] initWithObjects:fioModel1, fioModel2, fioModel3, nil];
    self.newsArray = [[NSArray alloc] initWithObjects:newsMadel1, newsModel2, newsModel3, newsModel4, nil];
    self.groupArray = [[NSArray alloc] initWithObjects:groupModel1, groupModel2, nil];
    //создание и внесение значений в словарь
    self.ollInfDictionary = [NSDictionary dictionaryWithObjectsAndKeys:usersArray, @(0), newsArray, @(1), groupArray, @(2), nil];
    
    UINib * cellnib1 = [UINib nibWithNibName:@"UserTableViewCell" bundle:nil];
    [self.table1 registerNib:cellnib1 forCellReuseIdentifier:@"cell1"];
    
    UINib * cellnib2 = [UINib nibWithNibName:@"NewsTableViewCell" bundle:nil];
    [self.table1 registerNib:cellnib2 forCellReuseIdentifier:@"cell2"];
    
    UINib * cellnib3 = [UINib nibWithNibName:@"GroupTableViewCell" bundle:nil];
    [self.table1 registerNib:cellnib3 forCellReuseIdentifier:@"cell3"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//задание размеров
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  70;
}

//задание названий заголовков
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        NSString *result = [NSString stringWithFormat:@"Секция: Пользователь"];
        return result;
    }
    else if (section == 1) {
        NSString *result = [NSString stringWithFormat:@"Секция: Новости"];
        return result;
    }
    else {
        NSString *result = [NSString stringWithFormat:@"Секция: Группы"];
        return result;
    }
}

//опеределение количества секций
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.ollInfDictionary count];
}

//определение количества записей в секции
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *valueArray = [ollInfDictionary objectForKey:@(section)];
    if (valueArray == nil) {
        return 0;
    }
    else {
        return [valueArray count];
    }
    
}

//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        static NSString *simpleTableIdentifier = @"cell1";
        UserTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//        if (cell1 == nil) {
//            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:simpleTableIdentifier owner:self options:nil];
//            cell1 =[nib objectAtIndex:0];
//        }
        NSArray *arrayObj = [self.ollInfDictionary objectForKey:@(indexPath.section)];
        FirstModel *newObj = arrayObj[indexPath.row];
        
        //сложение двух строк LastName и FirstName из класса FirstModel
        NSString *newString = [newObj.lastName stringByAppendingString:@" "];
        newString = [newString stringByAppendingString:newObj.ferstName];
        
        cell1.labelNameInModelUser.text = newString;
        cell1.imageInModelUser.image = newObj.iconName;
        
        return cell1;
    }
    else if (indexPath.section == 1) {
        static NSString *simpleTableIdentifier = @"cell2";
        NewsTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//        //регистрация xib, для использования в TableView
//        if (cell2 == nil) {
//            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:simpleTableIdentifier owner:self options:nil];
//            cell2 =[nib objectAtIndex:0];
//        }
        
        NSArray *arrayObj = [self.ollInfDictionary objectForKey:@(indexPath.section)];
        SecondModel * newObj = arrayObj[indexPath.row];
        cell2.labelDiscInModelNews.text = newObj.descSecondModel;
        cell2.labelTitleInModelNews.text = newObj.titleSecondModel;
        NSDateFormatter * aaa = [[NSDateFormatter alloc] init];
        [aaa setDateFormat:@"dd-MM-yyyy"];
        NSString *stringDate = [aaa stringFromDate:newObj.dateSecondModel];
        cell2.labelDateInModelNews.text = stringDate;
//        cell2.labelDateInModelNews.text = @"22.01.2018";
        return cell2;
    }
    else {
        static NSString *simpleTableIdentifier = @"cell3";
        GroupTableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//        if (cell3 == nil) {
//            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:simpleTableIdentifier owner:self options:nil];
//            cell3 =[nib objectAtIndex:0];
//        }
        NSArray *arrayObj = [self.ollInfDictionary objectForKey:@(indexPath.section)];
        ThirdModel *newObj = arrayObj[indexPath.row];
        cell3.labelTitleInModelGroup.text = newObj.titleThirdModel;
        cell3.labelDescrInModelGroup.text = newObj.descThirdModel;
        cell3.labelCountInModelGroup.text = newObj.countThirdModel;
        return cell3;
    }
}

@end
