//
//  ViewController.m
//  TutorialObjectiveC
//
//  Created by Muchamad Chozinul Amri on 10/5/19.
//  Copyright © 2019 Muchamad Chozinul Amri. All rights reserved.
//

#import "ThreadViewController.h"
#import <pthread.h>


@interface MyOperation : NSOperation

@end

@implementation MyOperation

- (void) main {
    for (int i = 0; i < 109; i++) {
        sleep(1);
        NSLog(@"NSOperation1 number %d", i);
        if (self.isCancelled) {
            break;
        }
    }
}

@end


@interface ThreadViewController ()

//atomic
//nonatomic

//readonly
//readwrite

//retain, strong
//unsafe_unretained, weak
//assign -> for primitive data type

@property (atomic, readwrite, retain) NSThread* thread;
@property (atomic, readwrite, retain) NSArray* numbers;


@property (assign) int theAssign;
@property (unsafe_unretained) int theUnsafaUnretain;

@property (assign) NSArray* theAssignObject;
@property (unsafe_unretained) NSArray* theUnsaveObject;
@property (weak) NSArray* theWeak;
@property (copy) NSArray* theCopy;
@property (retain) NSArray* theRetain;
@property (strong) NSArray* theStrong;

@end

@implementation ThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.theAssignObject lastObject]; //immutable value
    [self.theUnsaveObject lastObject];
    [self.theWeak lastObject];
    [self.theCopy lastObject]; //immutable valye
    [self.theRetain lastObject];
    [self.theStrong lastObject];
    
    NSLog(@"the  %@", self.theAssignObject);
    NSLog(@"the  %@", self.theUnsaveObject);
    NSLog(@"the  %@", self.theWeak);
    NSLog(@"the  %@", self.theCopy);
    NSLog(@"the  %@", self.theRetain);
    NSLog(@"the  %@", self.theStrong);
    
}

- (IBAction)threadStartPressed:(id)sender {
    [self fetchDataThread];
}

- (IBAction)threadCheckPressed:(id)sender {
    NSLog(@"is thread executing %d", self.thread.isExecuting);
    NSLog(@"is thread canceled %d", self.thread.isCancelled);
    NSLog(@"is thread finished %d", self.thread.isFinished);
}

- (IBAction)threadStopPressed:(id)sender {
    [self.thread cancel];
}

- (void) fetchDataThread {
    self.thread = [[NSThread alloc] initWithBlock: ^{
        for (int i = 0; i < 100; i++) {
            sleep(1);
            self.numbers = [self getData];
            NSLog(@"number 1 = %@", self.numbers[2]);
            if (self.thread.isCancelled) {
                NSLog(@"thread is canceled");
                break;
            }
        }
    }];
    [self.thread start];
}


- (IBAction)gcdStartPressed:(id)sender {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^ {
        for (int i = 0; i < 100; i++) {
            sleep(1);
            self.numbers = [self getData];
            NSLog(@"number 1 = %@", self.numbers[2]);
            if (self.thread.isCancelled) {
                NSLog(@"thread is canceled");
                break;
            }
        }
    });
}

- (IBAction)gcdGroupPressed:(id)sender {
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queue = dispatch_queue_create("com.amri.queue.test", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 5; i++) {
            sleep(1);
            self.numbers = [self getData];
            NSLog(@"number %d, 1 = %@", i, self.numbers[2]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 7; i++) {
            sleep(1);
            self.numbers = [self getData];
            NSLog(@"number %d, 1 = %@", i, self.numbers[2]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 9; i++) {
            sleep(1);
            self.numbers = [self getData];
            NSLog(@"number %d, 1 = %@", i, self.numbers[2]);
        }
    });
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"all gcd finished running");
    });
}

pthread_t pthread;

- (IBAction)startPThreadPressed:(id)sender {
    //Create a thread and exectute
    pthread_create(&pthread, NULL, start, NULL);
}

- (IBAction)stopPthreadPressed:(id)sender {
    pthread_kill(pthread, 0);
}

void *start(void *data) {
    NSLog(@"%@", [NSThread currentThread]);
    for (int i = 0; i < 109; i++) {
        sleep(1);
        NSLog(@"pthreads number %d", i);
    }
    return NULL;
}

NSOperationQueue* queue;

- (IBAction)nsoperationStartpressed:(id)sender {
    
    queue = [[NSOperationQueue alloc] init];
    
    NSOperation* operation0 = [[MyOperation alloc] init];
    NSOperation* operation1 = [[MyOperation alloc] init];
    NSOperation* operation2 = [[MyOperation alloc] init];
    
    NSOperation* finalOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"ALL IS DONE!");
    }];
    
    
    [finalOperation addDependency:operation0];
    [finalOperation addDependency:operation1];
    [finalOperation addDependency:operation2];
    
    
    [queue addOperation:operation0];
    [queue addOperation:operation1];
    [queue addOperation:operation2];
    [queue addOperation:finalOperation];
}

- (IBAction) nsoperationStoppressed:(id) sender {
    [[queue operations][0] cancel];
}

- (NSArray*) getData {
    return @[@(0),@(1),@(2),@(4),@(3)];
}



@end


