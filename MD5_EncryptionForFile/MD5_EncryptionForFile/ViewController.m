//
//  ViewController.m
//  MD5_EncryptionForFile
//
//  Created by 薛尧 on 16/3/12.
//  Copyright © 2016年 薛尧. All rights reserved.
//

#import "ViewController.h"
#import <CommonCrypto/CommonCrypto.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"lee" ofType:@"jpg"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(data.bytes, (CC_LONG)data.length, result);
    
    
    NSMutableString *resultString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        
        [resultString appendFormat:@"%02X",result[i]];
    }
    
    NSLog(@"%@",resultString);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
