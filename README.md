# WJFunctionThrottle
A lightweight Objective-C function throttle and debounce library.

[![CI Status](https://img.shields.io/travis/wangwanjie/WJFunctionThrottle.svg?style=flat)](https://travis-ci.org/wangwanjie/WJFunctionThrottle)
[![Version](https://img.shields.io/cocoapods/v/WJFunctionThrottle.svg?style=flat)](https://cocoapods.org/pods/WJFunctionThrottle)
[![License](https://img.shields.io/cocoapods/l/WJFunctionThrottle.svg?style=flat)](https://cocoapods.org/pods/WJFunctionThrottle)
[![Platform](https://img.shields.io/cocoapods/p/WJFunctionThrottle.svg?style=flat)](https://cocoapods.org/pods/WJFunctionThrottle)

# Effect

![Effect](https://github.com/wangwanjie/WJFunctionThrottle/blob/master/image/demo.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Use

```ObjC
if (text && text.length > 0) {
        [WJFunctionThrottle throttleWithInterval:0.5
                                             key:@"key"
                                         handler:^{
                                             NSLog(@"text changed, search for keyword：%@", textfield.text);
                                         }];
    } else {
        [WJFunctionThrottle throttleCancelWithKey:@"key"];
    }
    
 [WJFunctionThrottle throttleWithInterval:0.1
                                        type:WJFunctionThrottleTypeInvokeOnceInEachInterval
                                     handler:^{
                                         [self handerScrollViewDidScrollWithThrollteOffset:scrollView.contentOffset];
                                     }];
```

## Requirements

iOS 8 or above.

## Installation

WJFunctionThrottle is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WJFunctionThrottle'
```

## Author

wangwanjie, wangwanjie1993@gmail.com

## License

WJFunctionThrottle is available under the MIT license. See the LICENSE file for more info.
