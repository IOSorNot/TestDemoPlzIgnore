//
//  ALLListsViewController.m
//  Checklists
//
//  Created by SH205 on 14-9-28.
//  Copyright (c) 2014年 Razeware LLC. All rights reserved.
//

#import "ALLListsViewController.h"

@interface ALLListsViewController ()

@end

@implementation ALLListsViewController{
    NSMutableArray *_lists;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    if ((self = [super initWithCoder:aDecoder])) {
        _lists = [[NSMutableArray alloc]initWithCapacity:20];
        
        Checklist * list;
        list = [[Checklist alloc] init];
        list.name = @"Birthdays";
        [_lists addObject:list];
        
        list = [[Checklist alloc] init];
        list.name = @"Groceries";
        [_lists addObject:list];
        
        list = [[Checklist alloc] init];
        list.name = @"Cool Apps";
        [_lists addObject:list];
    
        list = [[Checklist alloc] init];
        list.name = @"To Do";
        [_lists addObject:list];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_lists count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Checklist * checklist = _lists[indexPath.row];
    cell.textLabel.text = checklist.name;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{//通过代码来设置push操作的发起者
   
    Checklist * checklist = _lists[indexPath.row];
    [self performSegueWithIdentifier:@"ShowChecklist" sender:checklist];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ShowChecklist"]) {
        ChecklistsViewController * controller = segue.destinationViewController;
        controller.checklist = sender;
    }
    else if([segue.identifier isEqualToString:@"AddChecklist"]){
        UINavigationController *navigationController = segue.destinationViewController;
        ListDetailViewController * controller = (ListDetailViewController *)navigationController.topViewController;
        controller.delegate = self;
        controller.checklistToEdit = nil;
    }
}
-(void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)listDetailViewController:(ListDetailViewController *)controller didFinishAddingChecklist:(Checklist *)checklist
{
    NSInteger newRowIndex = [_lists count];
    [_lists addObject:checklist];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:(UITableViewRowAnimationAutomatic)];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)listDetailViewController:(ListDetailViewController *)controller didFinishEditingChecklist:(Checklist *)checklist
{
    NSInteger index = [_lists indexOfObject:checklist];
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.text = checklist.name;
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_lists removeObjectAtIndex:indexPath.row];
    
    NSArray * indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end
