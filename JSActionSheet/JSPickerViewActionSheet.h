//
//  JSPickerViewActionSheet.h
//  JSActionSheet
//
//  Created by Jordan Stone on 4/27/12.
//  Copyright (c) 2012 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSActionSheetDelegate.h"

@interface JSPickerViewActionSheet : UIView {
    UIView *_containerView;
    UIView *_keyline;
}

@property (nonatomic, strong) UIPickerView *jsPickerView;
@property (nonatomic, strong) UIButton *doneButton;
@property (nonatomic, weak) id <JSActionSheetDelegate, UIPickerViewDelegate, UIPickerViewDataSource> delegate;


- (id)init;

- (void)showInView:(UIView *)view;
- (void)showFromToolbar;
- (void)showFromTabBar;
@end
