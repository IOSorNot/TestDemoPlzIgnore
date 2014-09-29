//
//  ListDetailViewController.m
//  Checklists
//
//  Created by SH205 on 14-9-28.
//  Copyright (c) 2014年 Razeware LLC. All rights reserved.
//

#import "ListDetailViewController.h"
#import "Checklist.h"

@interface ListDetailViewController ()

@end

@implementation ListDetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.checklistToEdit !=nil) {
        self.title =@"Edit Checklist";
        self.textField.text = self.checklistToEdit.name;
        self.doneBarButton.enabled = YES;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.textField becomeFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)cancel
{
    [self.delegate listDetailViewControllerDidCancel:self];
}

-(IBAction)done
{
    if (self.checklistToEdit == nil) {
        Checklist *checklist = [[Checklist alloc]init];
        checklist.name = self.textField.text;
        [self.delegate listDetailViewController:self didFinishAddingChecklist:checklist];
    }
    else {
        self.checklistToEdit.name = self.textField.text;
        [self.delegate listDetailViewController:self didFinishEditingChecklist:self.checklistToEdit];
    }
}

 -(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString * newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    self.doneBarButton.enabled = ([newText length] > 0);
    return YES;
}

@end
