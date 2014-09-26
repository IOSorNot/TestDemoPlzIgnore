//
//  AddItemViewController.h
//  Checklists
//
//  Created by SH205 on 14-9-26.
//  Copyright (c) 2014年 Razeware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ItemDetailViewController;
@class ChecklistItem;
@protocol ItemDetailViewControllerDelegate <NSObject>

-(void)itemDetailViewControllerDidCancel:(ItemDetailViewController *)controller;
-(void)itemDetailViewController:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistItem *)item;
-(void)itemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(ChecklistItem *)item;
@end
@interface ItemDetailViewController : UITableViewController <UITextFieldDelegate>//可以成为某个textfield的委托

- (IBAction)cancel:(id)sender;

- (IBAction)done:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property(weak,nonatomic) IBOutlet UIBarButtonItem * doneBarButton;

@property (weak, nonatomic) id <ItemDetailViewControllerDelegate> delegate;

@property( strong,nonatomic) ChecklistItem * itemToEdit;
@end
