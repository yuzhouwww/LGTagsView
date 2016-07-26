//
//  LGViewController.m
//  LGTagsView
//
//  Created by 于宙 on 07/26/2016.
//  Copyright (c) 2016 于宙. All rights reserved.
//

#import "LGViewController.h"
#import "LGTagsView/LGTagsView.h"

@interface LGViewController ()
{
    __weak IBOutlet LGTagsView *tagsView;
}
@end

@implementation LGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    tagsView.contentInset = UIEdgeInsetsMake(5, 5, 5, 5);
    [tagsView setTags:@[@"adfddfdf", @"dfdfdf3sfasgrg", @"dfdfd", @"elp", @"adfddfdf", @"adfddfdf", @"dfdfdf3sfasgrg", @"dfdfd", @"eldep", @"adfddfdf", @"adfddfdf", @"dfdfdf3sfasgrg", @"dfdfd", @"elpep", @"adfddfdf", @"adf", @"dfdfdf3sfasgrg", @"dfdfd", @"eldjdepep", @"adfdf"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)slideAction:(UISlider *)sender {
    tagsView.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width * sender.value;
}

@end
