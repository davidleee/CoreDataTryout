//
//  ViewController.m
//  CoreDataTryout
//
//  Created by Lee on 1/26/15.
//  Copyright (c) 2015 Scau. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "User.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UITextView *consoleTextView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)writeAction:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    
    User *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    newUser.name = self.nameTextField.text;
    newUser.age = @([self.ageTextField.text intValue]);
    newUser.height = @([self.heightTextField.text intValue]);
    newUser.weight = @([self.weightTextField.text intValue]);
    
//    [context save:NULL];
}

- (IBAction)readAction:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    NSError *error;
    NSArray *results = [context executeFetchRequest:fetchRequest error:&error];
    if ([results count]) {
        self.consoleTextView.text = [results description];
    } else {
        self.consoleTextView.text = [error localizedDescription];
    }
}

@end
