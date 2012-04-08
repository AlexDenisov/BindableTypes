## Bindable Foundation data types

### About

The framework consists of two class-clusters - BTNumber and BTString.   
These classes allow you to bind Foundation data types with CocoaTouch controls without any delegates.

### Features

- Binding in one string
- Only actual values at any time

**BTString**: allows to bind NSString with UITextField or UITextView.   
**BTNumber**: NSNumber binds with UISlider, UISwitch or UIStepper.

### Installation

    git clone git@github.com:AlexDenisov/BindableTypes.git

Open with XCode and build Build_Framework target.  
The BindableTypes.framework will be located in ~/Products/, this path can be changed in the shell-script in the Settings tab of target.  
Open your project Settings and add BindableTypes.framework to Link Binary With Libraries section.  


### Usage

Syntax is simple and clean.
These features very useful with your models.

Order.h

    @interface Order : NSObject
    ...
    @property (nonatomic, retain) BTString *productName;
    @property (nonatomic, retain) BTNumber *count;
    ...
    @end

Order.m
    
    @implementation Order
    ...
    @synthesize productName;
    @synthesize count;
    ...
    @end

EditOrderViewController.h

    ...
    @property (nonatomic, retain) IBOutlet UITextField *productNameTextField;
    @property (nonatomic, retain) IBOutlet UISlider *countSlider;
    @property (nonatomic, retain) Order *order;
    ...
    
EditOrderViewController.m
    
    ...
    - (void)viewDidLoad {
    ...
        self.order.productName = [BTString stringWithTextField:self.productNameTextField
                                                    withString:self.order.productnName.stringValue];
        self.order.count = [BTNumber numberWithSlider:self.countSlider 
                                           withNumber:self.order.count.numberValue];
    ...
    }
    ...

Now you always have the actual values: in the model and in view.

### Contacts

Bugs, questions and suggestions please send to 1101.debian@gmail.com
