//
//  AddItemViewController.h
//  Checklists
//
//  Created by SH205 on 14-9-25.
//  Copyright (c) 2014年 Razeware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddItemViewController : UITableViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
