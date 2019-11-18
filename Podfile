platform :ios, '9.0'

flutter_application_path = '../flutter_module/'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'flutterOC' do
  install_all_flutter_pods(flutter_application_path)
end
target 'flutterOCTests' do
  install_all_flutter_pods(flutter_application_path)
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
        end
    end
end

