//
//  TipViewController.m
//  Tippy
//
//  Created by Anna Thomas on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UIView *labelsAllContainerView;


@end

@implementation TipViewController






- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if(self.billField.text.length ==0) {
        [self hideLabels];
    }
}










- (IBAction)onTap:(id)sender {
    NSLog(@"hello");
    
    [self.view endEditing:true];
}









- (IBAction)updateLabels:(id)sender {
    
    
    double tipPercentages[] = {0.15, 0.2, 0.25};
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    double bill = [self.billField.text doubleValue];
    
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    
     
    self.tipLabel.text = [NSString
                          stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString
                            stringWithFormat:@"$%.2f", total];
    if(self.billField.text.length ==0) {
        [self hideLabels];
    } else{
        [self showLabels];
    }
}











- (void) hideLabels {
    [UIView animateWithDuration:0.0 animations:^{
        CGRect billFrame = self.billField.frame;
        billFrame.origin.y += 200;
        
        self.billField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsAllContainerView.frame;
        
        labelsFrame.origin.y = 88;
        
        self.labelsAllContainerView.frame = labelsFrame;
        
        self.labelsAllContainerView.alpha =0;
        
    }];

}




- (void) showLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billField.frame;
        billFrame.origin.y = 88;
        
        self.billField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsAllContainerView.frame;
        
        labelsFrame.origin.y = 268;
        
        self.labelsAllContainerView.frame = labelsFrame;
        
        self.labelsAllContainerView.alpha =100;
        
    }];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
