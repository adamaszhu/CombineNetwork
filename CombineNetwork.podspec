Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "CombineNetwork"
s.summary = "CombineNetwork allows a project to construct the network layer using Combine before iOS 13."
s.requires_arc = true
s.version = "0.3.2"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Adamas Zhu" => "developer@adamaszhu.com",
"Leon Nguyen" => "leon.nguyen291@gmail.com" }
s.homepage = "https://github.com/adamaszhu/CombineNetwork"
s.source = { :git => "https://github.com/adamaszhu/CombineNetwork.git",
:tag => "#{s.version}" }
s.source_files = "CombineNetwork/**/*.{swift}"
s.swift_version = "4.2"

s.framework = "Foundation"
s.dependency 'CombineRx', '~> 0.3.2'

end
