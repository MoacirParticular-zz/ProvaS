//
//  ViewController.h
//  ProvaS
//
//  Created by Moacir Lamego on 06/01/19.
//  Copyright © 2019 mobilesapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

{
    NSMutableArray* arrayLocal;
}
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;

@property (strong, nonatomic) IBOutlet UITableView *tabela;


@end

