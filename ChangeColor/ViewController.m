//
//  ViewController.m
//  ChangeColor
//
//  Created by 袁秘密 on 2019/3/21.
//  Copyright © 2019年 Yuanmimi. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Custom.h"

@interface ViewController ()<UITextFieldDelegate>

/** 输入框 **/
@property (nonatomic , strong) UITextField *textfield;

/** 转换颜色按钮 **/
@property (nonatomic , strong) UIButton *changeBtn;

/** 转换后的颜色展示View **/
@property (nonatomic , strong) UIView *randomView;

@property (nonatomic , strong) NSString *changeStr;

@property (nonatomic , strong) UILabel *demoLB;


@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.textfield];
    [self.view addSubview:self.changeBtn];
    [self.view addSubview:self.randomView];
    [self.view addSubview:self.demoLB];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.textfield becomeFirstResponder];/** 将键盘作为第一响应者 **/
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES]; //实现该方法是需要注意view需要是继承UIControl而来的
}



#pragma mark  changeBtn Action
- (void)changeColor
{
    self.changeStr = [NSString stringWithFormat:@"#%@",_textfield.text];
    self.randomView.backgroundColor = [UIColor colorWithHexString:[NSString stringWithFormat:@"%@",self.changeStr]];
    self.demoLB.textColor = [UIColor colorWithHexString:[NSString stringWithFormat:@"%@",self.changeStr]];

}

#pragma mark UITextField Delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    /** 监测输入长度，字符串长度最多为6 **/
    if (textField == self.textfield) {
        if (range.length == 1 && string.length == 0) {
            return YES;
        }
        else if(self.textfield.text.length >= 6)
        {
//            self.textfield.text = [textField.text substringFromIndex:6];
            return NO;
        }
    }
    
    /** 强制转换成全大写字母 **/
//    NSRange lowercaseCharRange;
//    lowercaseCharRange = [string rangeOfCharacterFromSet:[NSCharacterSet lowercaseLetterCharacterSet]];
//
//    if (lowercaseCharRange.location != NSNotFound) {
//
//        textField.text = [textField.text stringByReplacingCharactersInRange:range
//                                                                 withString:[string uppercaseString]];
//        return NO;
//    }
    return YES;
}

- (UITextField *)textfield
{
    if (!_textfield) {
        _textfield = [[UITextField alloc] initWithFrame:CGRectMake(30, 100, 315, 40)];
        _textfield.placeholder = @"请输入16进制";
        _textfield.clearButtonMode = UITextFieldViewModeAlways;
        _textfield.backgroundColor = [UIColor whiteColor];
        _textfield.borderStyle = UITextBorderStyleRoundedRect;
        _textfield.delegate = self;
        _textfield.keyboardType = UIKeyboardTypeASCIICapable;
        /** 强制转换成全大写字母 **/

        _textfield.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    }
    return _textfield;
}

- (UIButton *)changeBtn
{
    if (!_changeBtn) {
        _changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _changeBtn.frame = CGRectMake(150, 160, 80, 40);
        [_changeBtn setTitle:@"转换" forState:UIControlStateNormal];
        [_changeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _changeBtn.backgroundColor = [UIColor redColor];
        [_changeBtn addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeBtn;
}

- (UIView *)randomView
{
    if (!_randomView) {
        _randomView = [[UIView alloc] initWithFrame:CGRectMake(0, 210, self.view.frame.size.width, 40)];
        _randomView.backgroundColor = [UIColor blackColor];
    }
    return _randomView;
}

- (UILabel *)demoLB
{
    if (!_demoLB) {
        _demoLB = [[UILabel alloc] initWithFrame:CGRectMake(35, 280, 310, 60)];
        _demoLB.text = @"十六进制颜色转换";
        _demoLB.textColor = [UIColor blackColor];
        _demoLB.font = [UIFont systemFontOfSize:17];
        _demoLB.textAlignment = NSTextAlignmentCenter;
    }
    return _demoLB;
}


@end
