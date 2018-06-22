//
//  ViewController.m
//  CheckBoxCell
//
//  Created by Marco on 22/6/2018.
//  Copyright © 2018 Marco. All rights reserved.
//

#import "ViewController.h"
#import "QuestionDetailCustomCellTableViewCell.h"
@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *selectedArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.selectedArray = [NSMutableArray arrayWithCapacity:30];
    for (int i = 0; i<30; i++){
        [self.selectedArray addObject:[NSNumber numberWithInteger:0]];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"QuestionDetailCustomCell";
    
    QuestionDetailCustomCellTableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[QuestionDetailCustomCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSLog(@"%ld, %ld", (long)indexPath.section, (long)[[self.selectedArray objectAtIndex:indexPath.section] integerValue]);
    if([[self.selectedArray objectAtIndex:indexPath.section] integerValue] == [[NSNumber numberWithInteger:0] integerValue]){
        [cell.checkBox setOn:NO];
    }else{
        [cell.checkBox setOn:YES];
    }
    cell.checkBox.onAnimationType = BEMAnimationTypeBounce;
    cell.checkBox.offAnimationType = BEMAnimationTypeBounce;
    cell.checkBox.tag = indexPath.section;
    [cell.checkBox addTarget:self action:@selector(checkBoxTapped:) forControlEvents:UIControlEventValueChanged];
    return cell;
}

-(void)checkBoxTapped:(BEMCheckBox*)sender{
    
    NSLog(@"Sender.tag: %ld", (long)sender.tag);
    
    if (sender.on == true){
        [sender setOn:YES];
        NSLog(@"Now Turned On");
        [self.selectedArray replaceObjectAtIndex:sender.tag withObject:[NSNumber numberWithInteger:1]];
    }
    else{
        [sender setOn:NO];
        NSLog(@"Now Turned Off");
        [self.selectedArray replaceObjectAtIndex:sender.tag withObject:[NSNumber numberWithInteger:0]];
    }
}


-(void)smallPlayButtonClicked:(UIButton*)sender{
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}


@end
