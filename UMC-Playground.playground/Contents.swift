import UIKit

let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName /// userDefinedColorName이 nil이기 때문에 defaultColorName인 red를 반환
print(colorNameToUse)
