JSActionSheet
=============

A series of UIActionSheet-like views that you can use for iPhone

JSAction Sheet is very easy to use. Inside of a UIViewController, you can instantiate an instance of JSActionSheet and simply call showInView: on that instance.

Ex:
- (IBAction)showPickerActionSheet:(id)sender {
    JSPickerViewActionSheet *pickerAS = [[JSPickerViewActionSheet alloc] init];
    pickerAS.delegate = self;
    
    [pickerAS showInView:self.view];
}