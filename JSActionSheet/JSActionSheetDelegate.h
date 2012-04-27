//
//  JSActionSheetDelegate.h
//  JSActionSheet
//
//  Created by Jordan Stone on 4/27/12.
//  Copyright (c) 2012 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JSPickerViewActionSheet;

@protocol JSActionSheetDelegate <NSObject>

@optional
- (void)pickerViewActionSheet:(JSPickerViewActionSheet *)actionSheet didPressDoneButton:(UIButton *)doneButton;

@end
