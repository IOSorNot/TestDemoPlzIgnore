//
//  ChecklistsViewController.h
//  Checklists
//
//  Created by Matthijs on 30-09-13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"
@class Checklist;

@interface ChecklistsViewController : UITableViewController<ItemDetailViewControllerDelegate>

@property (nonatomic ,strong) Checklist * checklist;

@end
