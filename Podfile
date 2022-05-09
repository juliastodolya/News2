# Uncomment the next line to define a global platform for your project
 platform :ios, '13.0'

target 'News' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for News
  pod 'RxNetworkApiClient', :inhibit_warnings => true
  pod 'RxSwift', '~> 5.0.1', :inhibit_warnings => true
  pod 'RxCocoa', :inhibit_warnings => true
  pod 'R.swift', :inhibit_warnings => true
  pod 'DITranquillity', :inhibit_warnings => true

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if Gem::Version.new('9.0') > Gem::Version.new(config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'])
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
  end
end

