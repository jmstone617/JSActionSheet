//
//  ViewController.h
//  JSActionSheetDemo
//
//  Created by Jordan Stone on 4/27/12.
//  Copyright (c) 2012 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSActionSheetDelegate.h"

@interface ViewController : UIViewController <JSActionSheetDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIActionSheetDelegate>

- (IBAction)showPickerActionSheet:(id)sender;
- (IBAction)showActionSheet:(id)sender;

@end
