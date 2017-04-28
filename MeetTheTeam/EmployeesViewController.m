//
//  EmployeesViewController.m
//  MeetTheTeam
//
//  Created by Cathy Oun on 4/26/17.
//  Copyright © 2017 cathyoun. All rights reserved.
//

#import "EmployeesViewController.h"
#import "Employee.h"
#import "EmployeeCell.h"
#import "DetailViewController.h"

@interface EmployeesViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *allEmployees;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation EmployeesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Disable back button title on nav bar
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:self.navigationItem.backBarButtonItem.style
                                                                            target:nil
                                                                            action:nil];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.navigationItem.title = @"Meet The Team";
    
    UINib *employeeNib = [UINib nibWithNibName:@"EmployeeCell"
                                        bundle:[NSBundle mainBundle]];
    [self.tableView registerNib: employeeNib
         forCellReuseIdentifier:@"EmployeeCell"];
    self.tableView.estimatedRowHeight = 100;
    
    [self getAllEmployees];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}



- (void)getAllEmployees
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"team"
                                                     ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    
    NSError *jsonError;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingMutableContainers
                                                      error:&jsonError];
    if (jsonError) {
        NSLog(@"Error with json: %@", jsonError.localizedDescription);
    }
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    
    if ([jsonObject isKindOfClass:[NSArray class]]) {
        for (NSDictionary *employeeDict in jsonObject) {
            Employee *employee = [[Employee alloc] initWithJSONDictionary:employeeDict];
            NSLog(@"%@", employee.firstName);
            [tempArray addObject:employee];
        }
    }
    self.allEmployees = [tempArray copy];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    if ([segue.identifier isEqualToString:@"DetailViewController"]) {
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        DetailViewController *detailVC = segue.destinationViewController;
        detailVC.employee = self.allEmployees[indexPath.row];
    }
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allEmployees.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EmployeeCell *cell = (EmployeeCell *)[tableView dequeueReusableCellWithIdentifier:@"EmployeeCell"
                                                         forIndexPath:indexPath];
    cell.employee = self.allEmployees[indexPath.row];
//    [cell layoutIfNeeded];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Employee *employee = self.allEmployees[indexPath.row];
    if (employee.avatarImage == nil) {
        NSLog(@"Image is still being downloading"); 
    } else  {
        [self performSegueWithIdentifier:@"DetailViewController" sender:indexPath];
    }
}

@end



