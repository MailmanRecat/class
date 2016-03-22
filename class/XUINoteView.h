//
//  XUINoteView.h
//  class
//
//  Created by caine on 3/22/16.
//  Copyright © 2016 com.caine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XUINoteView : UITextView

@property( nonatomic, strong ) UIButton *checkButton;

- (instancetype)initWithTitle:(NSString *)title note:(NSString *)note;

@end
