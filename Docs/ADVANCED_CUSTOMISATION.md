# Advanced Customisation

Tabman can be customised to your own liking; including the definition of custom bars and indicators.

## Creating a custom TabmanBar
1) Simply create a bar object that inherits from `TabmanBar`.

```swift
import UIKit
import Tabman
import Pageboy

class MyCustomBar: TabmanBar {
}
```

2) Implement and override the following methods:

```swift
override func defaultIndicatorStyle() -> TabmanIndicator.Style {
	// declare default indicator style here
	return .line
}

override func usePreferredIndicatorStyle() -> Bool {
	// whether the bar should use preferredIndicatorStyle
	return true
}

override func constructTabBar(items: [TabmanBarItem]) {
	super.constructTabBar(items: items)
	
	// create your bar here     
}

override func update(forPosition position: CGFloat,
					 direction: PageboyViewController.NavigationDirection,
					 minimumIndex: Int, maximumIndex: Int) {
	super.update(forPosition: position, direction: direction,
				 minimumIndex: minimumIndex, maximumIndex: maximumIndex)
				 
	// update your bar for a positional update here              
}

override func update(forAppearance appearance: TabmanBar.AppearanceConfig) {
	super.update(forAppearance: appearance)
        
	// update the bar appearance here
}
```

The above functions provide all the necessary lifecycle events for keeping a `TabmanBar` correctly configured and up to date with the page view controller it responds to.

`Tabman` uses `intrinsicContentSize` to calculate the required height of the bar, simply override this to manually specify an explicit height.

3) Configure the `TabmanViewController` to use the new custom style.

```swift
override func viewDidLoad() {
	super.viewDidLoad()
	
	self.bar.style = .custom(type: MyCustomBar.self)
}
```

### Using a custom TabmanIndicator
As seen above, when creating a `TabmanBar` subclass you can specify the style for the indicator in `indicatorStyle()`.

```swift
override func indicatorStyle() -> TabmanIndicator.Style {
	return .line
}
```

This can be used to return a custom view to use as the `TabmanIndicator`:

1) Create an object that inherits from `TabmanIndicator`.

```swift
import UIKit
import Tabman
import Pageboy

class MyCustomIndicator: TabmanIndicator {
}
```

2) Implement and override the following methods:

```swift
public override func constructIndicator() {
        super.constructIndicator()
        
        // create your indicator here
}
```

3) Configure your custom `TabmanBar` to use your custom indicator.

```swift
override func indicatorStyle() -> TabmanIndicator.Style {
	return .custom(type: MyCustomIndicator.self)
}
```