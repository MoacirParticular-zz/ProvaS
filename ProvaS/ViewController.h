//
//  ViewController.h
//  ProvaS
//
//  Created by Moacir Lamego on 06/01/19.
//  Copyright © 2019 mobilesapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

{
    NSMutableArray* arrayLocal;
}

@property (strong, nonatomic) IBOutlet UITableView *tabela;


@end

