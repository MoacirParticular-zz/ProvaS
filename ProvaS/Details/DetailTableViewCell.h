//
//  DetailTableViewCell.h
//  ProvaS
//
//  Created by Moacir Lamego on 06/01/19.
//  Copyright © 2019 mobilesapp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel* login;
@property (nonatomic, strong) IBOutlet UILabel* url;
@property (nonatomic, strong) IBOutlet UILabel* state;
@property (nonatomic, strong) IBOutlet UILabel* title;
@property (nonatomic, strong) IBOutlet UILabel* body;

@property (nonatomic, strong) IBOutlet UIImageView* avatar;


@property (nonatomic, strong) UIColor *bgColor;


@end

NS_ASSUME_NONNULL_END
