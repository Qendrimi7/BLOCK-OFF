# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

# Ignore all warnings from all pods
inhibit_all_warnings!

# Default Pods for BLOCK OFF

def default_pods
  # Default pods
  pod 'IQKeyboardManagerSwift'
  pod 'Alamofire', '~> 4.7'
  pod 'SwiftyJSON', '~> 4.1.0'
  pod 'GoogleSignIn'
  pod 'SVProgressHUD'
  pod 'SDWebImage'
  pod 'Firebase'
  pod 'Firebase/Analytics'
  pod 'Firebase/Auth'
  
end

def shared_pods
  # Reactive Programming(RxSwift)
  pod 'RxSwift', '~> 4.0'
  pod 'RxCocoa', '~> 4.0'
end

target 'BLOCK OFF' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for BLOCK OFF
  default_pods
  shared_pods
  
  
  target 'BLOCK OFFTests' do
    inherit! :search_paths
    # Pods for testing
    shared_pods
  end
  
  target 'BLOCK OFFUITests' do
    # Pods for testing
  end
  
end
