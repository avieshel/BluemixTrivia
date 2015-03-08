//
//  GameViewContorller.m
//  BluemixTrivia
//
//  Created by Itay Zror on 3/8/15.
//  Copyright (c) 2015 Avi Eshel. All rights reserved.
//

#import "GameViewContorller.h"
#import "TRVQuestion.h"

@interface GameViewContorller ()

@property (weak, nonatomic) IBOutlet UILabel *qusetionLbl;
@property (weak, nonatomic) IBOutlet UITableView *ansTable;
@property (weak, nonatomic) IBOutlet UILabel *ansStatus;


@property TRVQuestion *someQuestion;
@property NSArray *ansArray;
@property NSArray *questionsArray;


@end


@implementation GameViewContorller


- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.ansTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.someQuestion = [[TRVQuestion alloc] init];
    self.qusetionLbl.text = self.someQuestion.question;
    self.ansArray = self.someQuestion.answers;
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    return self.ansArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString *stringForCell;
    stringForCell= [self.ansArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:stringForCell];
    return cell;
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
//(NSInteger)section{
//    NSString *headerTitle;
//    headerTitle = @"";
//    return headerTitle;
//}
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:
//(NSInteger)section{
//    NSString *footerTitle;
//    footerTitle = @"";
//    return footerTitle;
//}

#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row+1 == self.someQuestion.answer) {
        self.ansStatus.text = @"✅";
    }
    else{
        self.ansStatus.text = @"❌";
    }
        
}


@end
