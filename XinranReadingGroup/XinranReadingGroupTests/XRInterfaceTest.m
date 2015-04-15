//
//  XRInterfaceTest.m
//  XinranReadingGroup
//
//  Created by dreamer on 15/4/12.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "XRSearchBiz.h"
#import <ZYBlockDefine.h>
#import "XRBookListEntity.h"
#import "XRBookListItemEntity.h"
#import <ZYCoreDefine.h>
#import "XRBookService.h"
#import "XRBookEntity.h"

//测试数据
static NSString * const ISBN = @"9787550244146";
static NSString * const keyword = @"";
static NSString * const bookId = @"9787550244146";

@interface XRInterfaceTest : XCTestCase

@end

@implementation XRInterfaceTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSearch {
    XRSearchBiz *searchBiz = [[XRSearchBiz alloc] init];
    XCTestExpectation *expectation = [self expectationWithDescription:@"search test"];
    __weak XRSearchBiz *weakSearchBiz = searchBiz;
    [searchBiz fetchSearchResult:keyword success:^{
        XCTAssert(weakSearchBiz.bookList,@"search fail");
        DLog(@"search result is %@",weakSearchBiz.bookList);
    } failure:^(NSError *error) {
        XCTFail(@"search fail with error %@",error);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:5. handler:^(NSError *error) {
        if (error) {
            XCTFail(@"search fail with error %@",error);
        }
    }];
}

- (void)testBorrow {
    XCTestExpectation *expectation = [self expectationWithDescription:@"borrow test"];
    [XRBookService borrowBook:bookId success:^{
        XCTAssert(YES,@"borrow pass");
    } failure:^(NSError *error) {
        XCTFail(@"borrow fail with error %@",error);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:5. handler:^(NSError *error) {
        if (error) {
            XCTFail(@"borrow fail with error %@",error);
        }
    }];
}

- (void)testReturn {
    XCTestExpectation *expectation = [self expectationWithDescription:@"return test"];
    [XRBookService returnBook:bookId success:^{
        XCTAssert(YES,@"Return pass");
    } failure:^(NSError *error) {
        XCTFail(@"Return fail with error %@",error);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:5. handler:^(NSError *error) {
        if (error) {
            XCTFail(@"Return fail with error %@",error);
        }
    }];
}

- (void)testDonate {
    XCTestExpectation *expectation = [self expectationWithDescription:@"donate test"];
    [XRBookService donateBook:bookId success:^(id param) {
        if ([param isKindOfClass:[XRBookEntity class]]) {
            XRBookEntity *book = param;
            if (book.bookID) {
                XCTAssert(YES,@"donate pass");
            }
            else {
                XCTFail(@"donate fail,book data is empty %@",book);
                [expectation fulfill];
            }
        }
        else {
            XCTFail(@"donate fail book data is wrong %@",param);
            [expectation fulfill];
            XCTAssert(NO,@"donate fail");
        }
    } failure:^(NSError *error) {
        XCTFail(@"donate fail with error %@",error);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5. handler:^(NSError *error) {
        if (error) {
            XCTFail(@"donate fail with error %@",error);
        }
    }];
}

- (void)testShare {
    XCTestExpectation *expectation = [self expectationWithDescription:@"share test"];
    [XRBookService shareBook:bookId success:^(id param) {
        if ([param isKindOfClass:[XRBookEntity class]]) {
            XRBookEntity *book = param;
            if (book.bookID) {
                XCTAssert(YES,@"Share pass");
            }
            else {
                XCTFail(@"Share fail ,book data is empty %@",book);
                [expectation fulfill];
            }
        }
        else {
            XCTFail(@"Share fail book data is wrong %@",param);
            [expectation fulfill];
        }
    } failure:^(NSError *error) {
        XCTFail(@"Share fail with error %@",error);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:5. handler:^(NSError *error) {
        if (error) {
            XCTFail(@"Share fail with error %@",error);
        }
    }];
}

- (void)testBookDetail {
    XCTestExpectation *expectation = [self expectationWithDescription:@"book detail test"];
    [XRBookService bookDetail:ISBN success:^(id param) {
        DLog(@"book detail is %@",param);
        XCTAssert(YES,@"book detail pass");
    } failure:^(NSError *error) {
        XCTFail(@"book detail fail with error %@",error);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:5. handler:^(NSError *error) {
        if (error) {
            XCTFail(@"book detail fail with error %@",error);
        }
    }];
}

@end
