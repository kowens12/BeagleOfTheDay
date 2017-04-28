//
//  ViewController.m
//  BeagleOfTheDay
//
//  Created by Katherine Owens on 4/27/17.
//  Copyright © 2017 Katherine Owens. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeCall];
}

- (void)makeCall {
    
    NSURLSession *URLSession = [NSURLSession sharedSession];
    
    NSURL *beagleURL = [NSURL URLWithString:@"http://www.dankota.com/calculate/01"];
    
    NSURLSessionDataTask *dataTask = [URLSession dataTaskWithURL:beagleURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error == nil) {
            NSDictionary *dictionaryFromJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"");
            NSString *responseString = [dictionaryFromJSON valueForKey:@"result"];
            
            NSLog(@"The response is %@", (responseString));
        }
    }];
    
    [dataTask resume];
}


@end
