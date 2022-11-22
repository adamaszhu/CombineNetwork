Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '13.0'
s.name = "CombineNetwork"
s.summary = "CombineNetwork allows a project to construct the network layer using Combine before iOS 13."
s.requires_arc = true
s.version = "1.0.4"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Adamas Zhu" => "developer@adamaszhu.com" }
s.homepage = "https://github.com/adamaszhu/CombineNetwork"
s.source = { :git => "https://github.com/adamaszhu/CombineNetwork.git",
             :tag => "#{s.version}" }
s.frameworks = "Foundation", "Combine", "SystemConfiguration"
s.source_files = "CombineNetwork/**/*.{swift}"
s.swift_version = "5"
s.dependency 'CombineUtility', '~> 1.0.3'

end
