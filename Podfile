# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'DDShop' do
  # ignore all warnings from all pods
  # as these a third-party libraries, we cannot control them
  inhibit_all_warnings!

  # Pods for DDShop
  use_frameworks!
  pod 'Alamofire'
  pod 'PromiseKit'
  pod 'PromiseKit/Alamofire'
  pod 'ReSwift'
  pod 'ReSwiftThunk'
  pod 'SwiftLint'
  pod 'SwiftIcons'

  target 'DDShopTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Nimble'
  end

  target 'DDShopUITests' do
    #inherit! :search_paths
    # Pods for testing
    pod 'Nimble'
    pod 'Embassy'
    pod 'EnvoyAmbassador'
  end
end


