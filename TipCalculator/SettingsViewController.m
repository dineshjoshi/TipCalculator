//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Dinesh Joshi on 1/7/14.
//  Copyright (c) 2014 Dinesh Joshi. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultPctSelector;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    int defaultIndex = [SettingsViewController loadDefaultIndex];
    self.defaultPctSelector.selectedSegmentIndex = defaultIndex;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDefaultValueChanged:(id)sender {
    int defaultTipIndex = self.defaultPctSelector.selectedSegmentIndex;
    [SettingsViewController saveDefaultIndex:defaultTipIndex];
}

+ (BOOL) saveDefaultIndex: (int) defaultIdx {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:defaultIdx forKey:@"defaultIndex"];
    [defaults synchronize];
    return YES;
}

+ (int) loadDefaultIndex {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"defaultIndex"];
    return intValue;
}


@end
