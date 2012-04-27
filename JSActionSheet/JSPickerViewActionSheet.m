//
//  JSPickerViewActionSheet.m
//  JSActionSheet
//
//  Created by Jordan Stone on 4/27/12.
//  Copyright (c) 2012 IBM. All rights reserved.
//

#import "JSPickerViewActionSheet.h"

@implementation JSPickerViewActionSheet

@synthesize jsPickerView = _jsPickerView;
@synthesize doneButton = _doneButton;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _jsPickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
        _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_doneButton setTitle:@"Done!" forState:UIControlStateNormal];
        _containerView = [[UIView alloc] initWithFrame:CGRectZero];
        _keyline = [[UIView alloc] initWithFrame:CGRectZero];
        
        [self addSubview:_containerView];
        [self addSubview:_keyline];
        [_containerView addSubview:_jsPickerView];
        [_containerView addSubview:_doneButton];
        
        [_doneButton addTarget:self action:@selector(doneButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
        _keyline.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (id)init {
    self = [self initWithFrame:CGRectZero];
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)willMoveToSuperview:(UIView *)newSuperview {
    CGRect actionFrame = newSuperview.frame;
    self.frame = CGRectMake(actionFrame.origin.x,
                            actionFrame.origin.y - 20,
                            actionFrame.size.width,
                            actionFrame.size.height);
    
    self.jsPickerView.delegate = delegate;
    self.jsPickerView.dataSource = delegate;
}

- (void)didMoveToSuperview {
    // Set up the container view off screen
    _containerView.frame = CGRectMake(0, 500, self.frame.size.width, 280);
    _containerView.backgroundColor = [UIColor colorWithRed:96/255.0 green:101/255.0 blue:111/255.0 alpha:1.0];
    
    _keyline.frame = CGRectMake(_containerView.frame.origin.x,
                                _containerView.frame.origin.y - 1,
                                _containerView.frame.size.width,
                                1);
    
    // Set the picker's frame
    self.jsPickerView.frame = CGRectMake(0, _containerView.frame.size.height - 216, 320, 216);
    
    // Set the done button just above it.
    UIImage *buttonImage = [UIImage imageNamed:@"doneButton"];
    CGSize buttonSize = buttonImage.size;
    CGRect buttonFrame = CGRectMake(0, 
                                    self.jsPickerView.frame.origin.y - 55, 
                                    buttonSize.width,
                                    buttonSize.height);
    self.doneButton.frame = buttonFrame;
    self.doneButton.center = CGPointMake(_containerView.center.x, self.doneButton.center.y);
    [self.doneButton setImage:buttonImage forState:UIControlStateNormal];
}

- (void)showInView:(UIView *)view {
    [view addSubview:self];
    
    [UIView animateWithDuration:0.3 animations:^{
        _containerView.frame = CGRectMake(0, self.frame.size.height - 280, 320, 280);
        _keyline.frame = CGRectMake(_containerView.frame.origin.x,
                                    _containerView.frame.origin.y - 1,
                                    _containerView.frame.size.width,
                                    1);
    }];
}

- (void)showFromToolbar {
    
}

- (void)showFromTabBar {
    
}

- (void)doneButtonTapped:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _containerView.frame = CGRectMake(_containerView.frame.origin.x,
                                          500, 
                                          _containerView.frame.size.width,
                                          _containerView.frame.size.height);
        _keyline.frame = CGRectMake(_containerView.frame.origin.x,
                                    _containerView.frame.origin.y - 1,
                                    _containerView.frame.size.width,
                                    1);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if ([delegate respondsToSelector:@selector(pickerViewActionSheet:didPressDoneButton:)]) {
            [delegate pickerViewActionSheet:self didPressDoneButton:sender];
        }
    }];
}

@end
