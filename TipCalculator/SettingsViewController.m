//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Praveen Idiculla Mathews on 1/18/15.
//  Copyright (c) 2015 Praveen Idiculla Mathews. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *defaultTipLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;
- (IBAction)valueChange:(id)sender;
- (void)setDefaultTip;

@end

@implementation SettingsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipIndex = [defaults integerForKey:@"defaultPercentage"];
    if (defaultTipIndex <=2 && defaultTipIndex >= 0 ) {
        self.defaultTipControl.selectedSegmentIndex = defaultTipIndex;
    }
    else
        self.defaultTipControl.selectedSegmentIndex = 0;
    self.defaultTipLabel.text = [ NSString stringWithFormat:@"%i%%", (defaultTipIndex+1)*10 ];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//
- (IBAction)valueChange:(id)sender {
    [self setDefaultTip];
    
    
}

- (void)setDefaultTip {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *defaultTipValues = @[@(10), @(20), @(30)];
    
    int defaultTipIndex = self.defaultTipControl.selectedSegmentIndex;
    int defaultTipValue = [defaultTipValues[self.defaultTipControl.selectedSegmentIndex] floatValue];
    
    self.defaultTipLabel.text = [ NSString stringWithFormat:@"%i%%", defaultTipValue];
    
    // [defaults setObject:@"some_string_to_save" forKey:@"some_key_that_you_choose"];
    [defaults setInteger:defaultTipIndex forKey:@"defaultPercentage"];
    [defaults synchronize];
    
}
//

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
