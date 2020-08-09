# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Lawyer' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Lawyer

pod 'IQKeyboardManagerSwift'
pod 'SkyFloatingLabelTextField', '~> 3.0'
pod 'lottie-ios'
pod 'DropDown','2.3.4'
pod 'paper-onboarding'
pod 'ViewAnimator'
pod 'Cosmos', '~> 22.1'

  target 'LawyerTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'LawyerUITests' do
    # Pods for testing
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
        end
    end
end
