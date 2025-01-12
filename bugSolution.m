The correct approach involves only releasing objects that your class explicitly owns and has retained.  Use the `assign` property attribute when the object is not owned by your class. Using `retain` is essential if `MyClass` is responsible for managing the memory of `myObject`.

```objectivec
@implementation MyClass
@synthesize myObject;

- (id)init {
    self = [super init];
    if (self) {
        myObject = [[AnotherClass alloc] init]; //Retaining the object
    }
    return self;
}

- (void)dealloc {
    [myObject release];
    [super dealloc];
}
@end
```

**Important Note:**  Modern Objective-C uses Automatic Reference Counting (ARC), which largely eliminates the need for manual memory management.  In ARC, you wouldn't write `retain`, `release`, or `dealloc` directly. However, understanding this issue is crucial for maintaining legacy code or in situations where ARC is disabled.