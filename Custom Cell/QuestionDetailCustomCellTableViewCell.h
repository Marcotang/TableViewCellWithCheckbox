//
//  QuestionDetailCustomCellTableViewCell.h
//  uReplyLingua
//
//  Created by Deepansh Jagga on 5/6/2018.
//  Copyright © 2018 Deep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEMCheckBox.h"

@interface QuestionDetailCustomCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet BEMCheckBox *checkBox;
@property (weak, nonatomic) IBOutlet UILabel *dateTime;
@property (weak, nonatomic) IBOutlet UILabel *playbackDuration;
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIImageView *line;

@end
