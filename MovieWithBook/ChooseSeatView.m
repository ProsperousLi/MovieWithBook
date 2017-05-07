//
//  ChooseSeatView.m
//  MovieWithBook
//
//  Created by 13110100307 on 16/10/27.
//  Copyright © 2016年 13110100307. All rights reserved.
//

#import "ChooseSeatView.h"

@implementation ChooseSeatView

static int seatIndex = 0;

-(instancetype)init {
    if (self = [super init]) {
        
        seatIndex = 0;
        
        self.frame = [UIScreen mainScreen].bounds;
        
        self.backgroundColor = [UIColor colorWithHex:primary_color_0];
        
        [self addSubview:self.cinema_nameLabel];
        
        [self addSubview:self.typeLabel];
        
        [self addSubview:self.beginTimeLabel];
        
        [self addSubview:self.movieTimelabel];
        
        [self addSubview:self.priceLabel];
        
        [self addSubview:self.imageView];

        
        [self addSubview:self.seatImageView];
        
        [self addSubview:self.seatScrollView];
        
        [self addSubview:self.paiView];
        
        [self ButtomView];
    }
    return  self;
}

-(UILabel *)cinema_nameLabel {
    if (!_cinema_nameLabel) {
        _cinema_nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/50, 64 +ScreenHeight/100, 3 * ScreenWidth/4, ScreenHeight/20)];

        
        _cinema_nameLabel.backgroundColor = [UIColor clearColor];
        
        _cinema_nameLabel.textColor = [UIColor colorWithHex:main_mask_lighter];
        
        //_cinema_nameLabel.text = self.movieName;

    }
    return _cinema_nameLabel;
}

-(UILabel *)typeLabel {
    if (!_typeLabel) {
        
       _typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/50, 68 + ScreenHeight/30, ScreenWidth/2, ScreenHeight/25)];
        
        _typeLabel.backgroundColor = [UIColor clearColor];
        
        _typeLabel.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
        
        _typeLabel.font = [UIFont systemFontOfSize:13];
        
        //_typeLabel.text = self.movieType;
    }
    
    return _typeLabel;
}

-(UILabel *)beginTimeLabel {
    if (!_beginTimeLabel) {
        _beginTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/50, _typeLabel.frame.size.height+_typeLabel.frame.origin.y, ScreenWidth/2, ScreenHeight/25)];
        _beginTimeLabel.backgroundColor = [UIColor clearColor];
        
        _beginTimeLabel.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
        
        _beginTimeLabel.font = [UIFont systemFontOfSize:13];
    }
    
    return _beginTimeLabel;
}

-(UILabel *)movieTimelabel {
    if (!_movieTimelabel) {
        _movieTimelabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/50, _beginTimeLabel.frame.size.height+_beginTimeLabel.frame.origin.y, ScreenWidth/2, ScreenHeight/25)];
        _movieTimelabel.backgroundColor = [UIColor clearColor];
        
        _movieTimelabel.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
        
        _movieTimelabel.font = [UIFont systemFontOfSize:13];
    }
    
    return _movieTimelabel;
}

-(UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/50, _movieTimelabel.frame.size.height+_movieTimelabel.frame.origin.y, ScreenWidth/2, ScreenHeight/25)];
        _priceLabel.backgroundColor = [UIColor clearColor];
        
        
        _priceLabel.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
        
        _priceLabel.font = [UIFont systemFontOfSize:13];
        
        
    }
    
    return _priceLabel;
}

-(UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/1.6, 64, ScreenWidth/4, ScreenHeight/5)];
    }
    
    return _imageView;
}


-(UIView *)seatImageView {
    if (!_seatImageView) {
        _seatImageView = [[UIView alloc] initWithFrame:CGRectMake(0, 64 + ScreenHeight/5, ScreenWidth, ScreenHeight/18)];
        
        _seatImageView.backgroundColor = [UIColor colorWithHex:primary_color_grey_200];
        
        [_seatImageView addSubview:self.selectButton];
        
        [_seatImageView addSubview:self.didiSelectButton];
        
        
        [_seatImageView addSubview:self.SelecttingButton];
        
    }
    
    return _seatImageView;
}

-(UIButton *)selectButton {
    if (!_selectButton) {
        _selectButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenHeight/50, ScreenHeight/100, ScreenWidth/8, ScreenHeight/22)];
        
        [_selectButton setImage:[UIImage imageNamed:selectPicture] forState:UIControlStateNormal];
        
        _selectButton.selected = NO;
    }
    
    return _selectButton;
}

-(UIButton *)didiSelectButton {
    if (!_didiSelectButton) {
        _didiSelectButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenHeight/50 + ScreenWidth/6, ScreenHeight/100, ScreenWidth/8, ScreenHeight/22)];
        
        [_didiSelectButton setImage:[UIImage imageNamed:didSelectPicture] forState:UIControlStateNormal];
        
        _didiSelectButton.selected = NO;
        
    }
    
    return _didiSelectButton;
}

-(UIButton *)SelecttingButton {
    if (!_SelecttingButton) {
        _SelecttingButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenHeight/50 +ScreenWidth/3, ScreenHeight/100, ScreenWidth/8, ScreenHeight/22)];
        
        [_SelecttingButton setImage:[UIImage imageNamed:selecttingPicture] forState:UIControlStateNormal];
        
        _SelecttingButton.selected = NO;
        
    }
    
    return _SelecttingButton;
}


-(UIScrollView *)seatScrollView {
    if (!_seatScrollView) {
        _seatScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _seatImageView.frame.origin.y + _seatImageView.frame.size.height + 10, ScreenWidth, ScreenHeight/2)];
        _seatScrollView.pagingEnabled = NO;  //开启分页
        _seatScrollView.scrollEnabled = YES;
        _seatScrollView.canCancelContentTouches = NO;
        
        _seatScrollView.showsHorizontalScrollIndicator = YES;  //水平滚动条
        
        _seatScrollView.backgroundColor = [UIColor colorWithHex:primary_color_grey_200];
        
        
        
        [_seatScrollView setContentSize:CGSizeMake(3 *ScreenWidth /2 + ScreenWidth/10 +ScreenWidth/2, 0)];
        
        [_seatScrollView addSubview:self.seatView];
        
        [_seatScrollView addSubview:self.PingMuLabel];
        
        
        UILabel *CenterLabel = [[UILabel alloc] initWithFrame:CGRectMake(_seatScrollView.frame.origin.x + ScreenWidth/10 * 6 + ScreenWidth/40 *6 + ScreenWidth/90, _PingMuLabel.frame.size.height, ScreenWidth/100, _seatScrollView.frame.size.height - _PingMuLabel.frame.size.height)];
        
        
        CenterLabel.backgroundColor = [UIColor blackColor];
        
        [_seatScrollView addSubview:CenterLabel];
    }
    
    return _seatScrollView;
}

-(UILabel *)PingMuLabel {
    if (!_PingMuLabel) {
        _PingMuLabel = [[UILabel alloc] initWithFrame:CGRectMake((3 *ScreenWidth /2)/2 - ScreenWidth/4, 0, ScreenWidth/2, ScreenHeight/20)];
        
        _PingMuLabel.backgroundColor = [UIColor colorWithHex:primary_color_grey_500];
        
        _PingMuLabel.text = @"x号厅银幕";
        
        _PingMuLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _PingMuLabel;
}

-(UIView *)paiView {
    if (!_paiView) {
        _paiView = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth/50, _seatScrollView.frame.origin.y, ScreenWidth/20, _seatScrollView.frame.size.height)];
        _paiView.backgroundColor = [UIColor colorWithHex:primary_color_grey_500 alpha:0.5];
        
        for (int i = 0; i < 7; i++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, ScreenHeight/15 + ScreenHeight/20 * i + ScreenWidth/40 *i, _paiView.frame.size.width,ScreenHeight/20)];
            
            label.text = [NSString stringWithFormat:@"%d",i+1];
            
            label.textAlignment = NSTextAlignmentCenter;
            
            label.font = [UIFont systemFontOfSize:16];
            
            [_paiView addSubview:label];
        }
    }
    return _paiView;
}

-(UIView *)seatView {
    if (!_seatView) {
        _seatView = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth*(13/84.0), ScreenHeight/15, _seatScrollView.contentSize.width - ScreenWidth/5, _seatScrollView.frame.size.height)];
        
        _selectButtonArray = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 11; i++) {
            
            for (int j = 0; j < 7; j ++) {
                UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/10 * i + ScreenWidth/40 *i, ScreenWidth/40 *j + ScreenHeight/20 *j, ScreenWidth/10, ScreenHeight/20)];
                
                button.tag = j * 11 + (i+1);
                
                [button setImage:[UIImage imageNamed:selectPicture] forState:UIControlStateNormal];
                
                [button addTarget:self action:@selector(seatButton:) forControlEvents:UIControlEventTouchUpInside];
                
                [_seatView addSubview:button];
            }
            
        }
        
        _didselectButtonTagArray = [[NSMutableArray alloc] init];
        
        _piaoPaiArray = [[NSMutableArray alloc] init];
        
        _piaoZuoArray = [[NSMutableArray alloc] init];
        
        _piaoShowButton = [[NSMutableArray alloc] init];
        
        _seatView.backgroundColor = [UIColor clearColor];
    }
    
    return _seatView;
}


-(void)seatButton:(UIButton *)sender {
    
    for (int i = 0; i < [_piaoShowButton count]; i++) {
        [[_piaoShowButton objectAtIndex:i] removeFromSuperview];
    }


    [self reloadInputViews];
    
    int haveDoubleIndex = -1;
    
    int i = 0;
    
    if (seatIndex < 4 ) {
        
        NSInteger pai = sender.tag / 11 + 1;
        
        NSInteger zuo = sender.tag % 11;
        
        
        if ([_didselectButtonTagArray count] == 0) {
            
            
            [_didselectButtonTagArray addObject:[NSString stringWithFormat:@"%ld",(long)sender.tag]];
            
            [_selectButtonArray addObject:sender];
            
            [sender setImage:[UIImage imageNamed:selecttingPicture] forState:UIControlStateNormal];
    
            
            //[self addSubview:button];
            
            [_piaoPaiArray addObject:[NSString stringWithFormat:@"%ld",(long)pai]];
            
            [_piaoZuoArray addObject:[NSString stringWithFormat:@"%ld",(long)zuo]];
            
            seatIndex ++;
        }
        else{
            for (NSString* tagString in _didselectButtonTagArray) {
                
                
                if ([tagString integerValue] == sender.tag) {
                    
                    haveDoubleIndex = i;
                    //[_didselectButtonTagArray delete:tagString];
                }
                
                i++;
            }
            
            if (haveDoubleIndex != -1) {
                
                [_didselectButtonTagArray removeObjectAtIndex:haveDoubleIndex];
                
                [[_selectButtonArray objectAtIndex:haveDoubleIndex] setImage:[UIImage imageNamed:selectPicture] forState:UIControlStateNormal];
                
                [_selectButtonArray removeObjectAtIndex:haveDoubleIndex];
                
                [_piaoPaiArray removeObjectAtIndex:haveDoubleIndex ];
                
                [_piaoZuoArray removeObjectAtIndex:haveDoubleIndex ];

                
                seatIndex--;
                
            }
            
            else {
                
                [_didselectButtonTagArray addObject:[NSString stringWithFormat:@"%ld",(long)sender.tag]];
                
                [_selectButtonArray addObject:sender];
                
                [sender setImage:[UIImage imageNamed:selecttingPicture] forState:UIControlStateNormal];
                
                

                [_piaoPaiArray addObject:[NSString stringWithFormat:@"%ld",(long)pai]];
                
                [_piaoZuoArray addObject:[NSString stringWithFormat:@"%ld",(long)zuo]];
                
                //[self addSubview:button];
                
                seatIndex ++;
                
            }
        }

        
    }
    else if (seatIndex >= 4) {
        
        for (NSString* tagString in _didselectButtonTagArray) {
            
            
            if ([tagString integerValue] == sender.tag) {
                
                haveDoubleIndex = i;
                //[_didselectButtonTagArray delete:tagString];
            }
            
            i++;
        }
        
        if (haveDoubleIndex != -1) {
            
            [_didselectButtonTagArray removeObjectAtIndex:haveDoubleIndex];
            
            [[_selectButtonArray objectAtIndex:haveDoubleIndex] setImage:[UIImage imageNamed:selectPicture] forState:UIControlStateNormal];
            
            [_selectButtonArray removeObjectAtIndex:haveDoubleIndex];
            
            [_piaoPaiArray removeObjectAtIndex:haveDoubleIndex ];
            
            [_piaoZuoArray removeObjectAtIndex:haveDoubleIndex ];
            
            
            seatIndex--;
            
        }
        else {
        
        
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"提示" message:@"最多购买4张票" delegate:self cancelButtonTitle:nil otherButtonTitles:@"好的", nil];
        
            [alertview show];
        }
    }
    
    NSLog(@"index : %d",seatIndex);
    
    if (seatIndex > 0) {
        
        _reallyBuybutton.backgroundColor = [UIColor colorWithHex:primary_color_orange_700];
        
        [_reallyBuybutton setTitle:@"确认选座" forState:UIControlStateNormal];
        
        [_reallyBuybutton setUserInteractionEnabled:YES];
    }
    else if (seatIndex == 0) {
        _reallyBuybutton.backgroundColor = [UIColor colorWithHex:primary_color_orange_100];
        
        [_reallyBuybutton setTitle:@"请先选座" forState:UIControlStateNormal];
        
        [_reallyBuybutton setUserInteractionEnabled:NO];
    }
    
    //显示座位的文字信息
    for (int i = 0; i < [_piaoPaiArray count]; i++) {
        
        //NSLog(@"%@,%@",[_piaoPaiArray objectAtIndex:i],[_piaoZuoArray objectAtIndex:i]);
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * (ScreenWidth/6 + ScreenWidth/20), ScreenHeight - ScreenHeight / 9, ScreenWidth/6, ScreenHeight/25)];
        
        [button setBackgroundColor:[UIColor colorWithHex:primary_color_500_mask]];
        
        [button setTitle:[NSString stringWithFormat:@"%@排%@座",[_piaoPaiArray objectAtIndex:i],[_piaoZuoArray objectAtIndex:i]] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_piaoShowButton addObject:button];
        
        [self addSubview:button];
    }
    

    
    
    //NSLog(@"%@",_selectButtonArray);
    
    //NSLog(@"%@",_didselectButtonTagArray);
    
    NSLog(@"点击了第 %ld 个按钮",(long)sender.tag);
}


-(void)ButtomView {
    
    //提示
    UILabel *littleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, ScreenHeight - ScreenHeight/20, ScreenWidth/2, ScreenHeight/20)];
    
    littleLabel.textAlignment = NSTextAlignmentCenter;
    
    littleLabel.textColor = [UIColor colorWithHex:main_text_title_color_light];
    
    littleLabel.backgroundColor = [UIColor clearColor];
    
    littleLabel.text = @"一次最多选择4个座位";
    
    [self addSubview:littleLabel];
    
    _reallyBuybutton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/2 + ScreenWidth / 10, ScreenHeight - ScreenHeight / 18, ScreenWidth/3, ScreenHeight/20)];
    
    _reallyBuybutton.backgroundColor = [UIColor colorWithHex:primary_color_orange_100];
    
    [_reallyBuybutton setTitle:@"请先选座" forState:UIControlStateNormal];
    
    [_reallyBuybutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    [_reallyBuybutton setUserInteractionEnabled:NO];
    
    [_reallyBuybutton addTarget:self action:@selector(reallySeatAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_reallyBuybutton];
}

-(void)reallySeatAction:(UIButton *)sender {

  //  NSLog(@"%@",[[DataBase sharedDataBase] getAllTickets]) ;
    
    self.DidAction();
}

@end
