# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Mixer' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

	pod 'React', :path => '../RNApp/node_modules/react-native', :subspecs => [
    		'Core',
    		'CxxBridge', # Include this for RN >= 0.47
    		'DevSupport', # Include this to enable In-App Devmenu if RN >= 0.43
    		'RCTText',
    		'RCTNetwork',
    		'RCTImage',
    		'RCTWebSocket', # Needed for debugging
    		# Add any other subspecs you want to use in your project
	]
  
  	pod 'yoga', :path => '../RNApp/node_modules/react-native/ReactCommon/yoga'

  	# Third party deps podspec link
  	pod 'DoubleConversion', :podspec => '../RNApp/node_modules/react-native/third-party-podspecs/DoubleConversion.podspec'
  	pod 'glog', :podspec => '../RNApp/node_modules/react-native/third-party-podspecs/glog.podspec'
  	pod 'Folly', :podspec => '../RNApp/node_modules/react-native/third-party-podspecs/Folly.podspec'


  target 'MixerTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
