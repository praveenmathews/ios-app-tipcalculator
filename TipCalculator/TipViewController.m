//
//  TipViewController.m
//  TipCalculator
//
//  Created by Praveen Idiculla Mathews on 1/18/15.
//  Copyright (c) 2015 Praveen Idiculla Mathews. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (void)onSettingsButton;
- (void)updateSelection;

@end

@implementation TipViewController

- (void)updateSelection{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipIndex = [defaults integerForKey:@"defaultPercentage"];
    if (defaultTipIndex <=2 && defaultTipIndex >= 0 ) {
        self.tipControl.selectedSegmentIndex = defaultTipIndex;
    }
    else
        self.tipControl.selectedSegmentIndex = 0;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateValues];
    
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    [self updateSelection];
    [self updateValues];
    
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
    [self updateSelection];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues{
    float billAmount = [self.billTextField.text floatValue];
    
    NSArray *tipValues = @[@(0.1), @(0.2), @(0.3)];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipIndex = [defaults integerForKey:@"defaultPercentage"];
    NSLog(@"%i", defaultTipIndex);
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billAmount ;
    
    self.tipLabel.text = [ NSString stringWithFormat:@"$%.2f", tipAmount];
    self.totalLabel.text = [ NSString stringWithFormat:@"$%.2f", totalAmount];
    
}
- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
    
}
@end
