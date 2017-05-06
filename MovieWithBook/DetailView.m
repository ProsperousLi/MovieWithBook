//
//  DetailView.m
//  MovieWithBook
//
//  Created by 13110100307 on 16/9/5.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "DetailView.h"

@implementation DetailView

-(instancetype)init {
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.scrollView];
        [self addSubview:self.buyView];
        [_buyView addSubview:self.buyButton];
    }
    
    return self;
}

-(UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _scrollView.backgroundColor = [UIColor colorWithHex:primary_color_0];
        
        _scrollView.pagingEnabled = NO;  //开启分页
        _scrollView.scrollEnabled = YES;
        _scrollView.canCancelContentTouches = NO;
        _scrollView.showsVerticalScrollIndicator = NO;  //水平滚动条
        _scrollView.bounces = YES;
        _scrollView.directionalLockEnabled = YES; //设置每次只能朝一个方向滚动
        
        [_scrollView setContentSize:CGSizeMake(0, ScreenHeight)];
        
        [_scrollView addSubview:self.imageView];
        
        [_scrollView addSubview:self.title];
        
        [_scrollView addSubview:self.avg];
        
        [_scrollView addSubview:self.genres];
        
        [_scrollView addSubview:self.countries];
        
        [_scrollView addSubview:self.textView];
        
        [_scrollView addSubview:self.original_title];
        
    }
    
    return _scrollView;
}

-(UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/100,  ScreenHeight/100, (ScreenWidth/2 )/2, (2 * ScreenWidth/3 + ScreenWidth/10)/2)];
        //_imageView.backgroundColor = [UIColor grayColor];
        
        //[_imageView setImage:[UIImage imageNamed:@"placeholder.png"]];
        
        
    }
    
    return _imageView;
}

-(UIView *)buyView {
    if (!_buyView) {
        _buyView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight -  ScreenHeight/10 + ScreenHeight/50, ScreenWidth, ScreenHeight/10 - ScreenHeight/50)];
        _buyView.backgroundColor = [UIColor grayColor];
        
    }
    return _buyView;
}

-(UIButton *)buyButton {
    if (!_buyButton) {
        _buyButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,ScreenWidth,_buyView.frame.size.height)];
        _buyButton.backgroundColor  = [UIColor colorWithHex:primary_color_500_mask];
        
        [_buyButton setTitle:@"购               票" forState:UIControlStateNormal];
        
        
        [_buyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_buyButton addTarget:self action:@selector(buyAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buyButton;
}

-(void)buyAction:(UIButton*)sender {
    NSLog(@"购票成功");
    
    if (self.DidBuyAction) {
        self.DidBuyAction();
    }
    else {
        NSLog(@"回调失败");
    }
}

-(UILabel *)title {
    
    if (!_title) {
        
        //        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2 + ScreenWidth/20, ScreenHeight/100, ScreenWidth/8, ScreenHeight/20)];
        //
        //        lable.backgroundColor = [UIColor clearColor];
        //
        //        lable.text = @"片 名";
        //
        //        lable.textColor = [UIColor colorWithHex:main_text_title_color_lighter];;
        
        //        [_scrollView addSubview:lable];
        
        _title = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/3, ScreenHeight/100, ScreenWidth, ScreenHeight/20)];
        _title.backgroundColor = [UIColor clearColor];
        
        _title.textColor = [UIColor colorWithHex:main_text_title_color_dark];
        
        _title.font = [UIFont systemFontOfSize:20];
        
    }
    return _title;
}

-(UILabel *)original_title {
    if (!_original_title) {
        _original_title = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/3, ScreenHeight/20, ScreenWidth/2, ScreenHeight/20)];
        _original_title.backgroundColor = [UIColor clearColor];
        
        _original_title.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
        
        _original_title.font = [UIFont systemFontOfSize:12];
        
    }
    return _original_title;
}

-(UILabel *)avg {
    if (!_avg) {
        
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/3, ScreenHeight/10, ScreenWidth/6, ScreenHeight/20)];
        
        lable.backgroundColor = [UIColor clearColor];
        
        lable.text = @"豆瓣评分";
        
        lable.font = [UIFont systemFontOfSize:14];
        
        
        lable.textColor = [UIColor colorWithHex:main_text_title_color_dark];;
        
        [_scrollView addSubview:lable];
        
        _avg = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2, ScreenHeight/10, ScreenWidth/4, ScreenHeight/20)];
        _avg.backgroundColor = [UIColor clearColor];
        
        _avg.textColor = [UIColor colorWithHex:main_text_title_color_dark];
        
        _avg.font = [UIFont systemFontOfSize:14];
        
        
        //_avg.text = @"7.6";
    }
    return _avg;
}

-(UILabel *)genres {
    if (!_genres) {
        
        _genres = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/3, ScreenHeight/7, ScreenWidth, ScreenHeight/20)];
        _genres.backgroundColor = [UIColor clearColor];
        
        _genres.textColor = [UIColor colorWithHex:main_text_title_color_dark];
        
        _genres.font = [UIFont systemFontOfSize:14];
        
    }
    
    return _genres;
}

-(UILabel *)countries {
    if (!_countries) {
        
        _countries = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/3 , ScreenHeight/5.5, ScreenWidth, ScreenHeight/20)];
        _countries.backgroundColor = [UIColor clearColor];
        
        _countries.textColor = [UIColor colorWithHex:main_text_title_color_dark];
        
        _countries.font = [UIFont systemFontOfSize:14];
        
    }
    
    return _countries;
}

-(UITextView *)textView {
    if (!_textView) {
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/100,  ScreenHeight/100 + (2 * ScreenWidth/3 + ScreenWidth/10), ScreenWidth/3, ScreenHeight/20)];
        
        lable.backgroundColor = [UIColor clearColor];
        
        lable.text = @"  简     介";
        
        // lable.textAlignment = NSTextAlignmentCenter;
        
        lable.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
        
        [_scrollView addSubview:lable];
        
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, ScreenHeight/15 + (2 * ScreenWidth/3 + ScreenWidth/10), ScreenWidth, ScreenHeight/2)];
        _textView.backgroundColor = [UIColor clearColor];
        
        _textView.delegate =self;
        
        _textView.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
        
        _textView.font = [UIFont systemFontOfSize:14];
        
        _textView.editable = NO;
        
        _textView.selectable = NO;
        
        
        [_textView addSubview:self.On_TextView];
    }
    
    return _textView;
}

-(UIView *)On_TextView {
    if (!_On_TextView) {
        
        _On_TextView = [[UIView alloc] init];
        
        _On_TextView.frame = CGRectMake(0, 0, ScreenWidth,ScreenHeight - ( ScreenHeight/15 + (2 * ScreenWidth/3 + ScreenWidth/10)));
        
        _On_TextView.backgroundColor = [UIColor clearColor];
    }
    
    return _On_TextView;
}


@end
