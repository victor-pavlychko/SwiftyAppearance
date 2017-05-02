# SwiftyAppearance Change Log

## [Version 1.1.0](https://github.com/victor-pavlychko/SwiftyAppearance/releases/tag/1.1.0)
*Released on 2017-05-??.*

- moved `UIView.refreshSubviewAppearance` to `UIWindow` where it belongs and renamed to `refreshAppearance`
- renamed `UIApplication.refreshApplicationAppearance` to `refreshAppearance`
= added `AppearanceView` for application theming

## [Version 1.0.2](https://github.com/victor-pavlychko/SwiftyAppearance/releases/tag/1.0.2)
*Released on 2016-11-27.*

- added `UIView.refreshSubviewAppearance` and `UIApplication.refreshApplicationAppearance` methods to reload app look after changing `UIApperance` (useful for theme support)

## [Version 1.0.1](https://github.com/victor-pavlychko/SwiftyAppearance/releases/tag/1.0.1)
*Released on 2016-11-18.*

- added `appearance(in:)` convenience method for single enclosing container case
- fixed bug when `UIAppearance.appearance` method familiy did not add `Self` in container chain of nested scope

## [Version 1.0.0](https://github.com/victor-pavlychko/SwiftyAppearance/releases/tag/1.0.0)
*Released on 2016-11-13.*

- Initial release
