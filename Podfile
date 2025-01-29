## Uncomment the next line to define a global platform for your project
#platform :ios, '13.1'
#
#target 'Real Chat' do
#  # Comment the next line if you don't want to use dynamic frameworks
#  use_frameworks!
#
#  # Pods for Real Chat
#  pod 'Firebase/Auth'
#  pod 'Firebase/Firestore'
#
#  post_install do |installer|
#    installer.pods_project.targets.each do |target|
#      if target.name == 'Realm'
#        create_symlink_phase = target.shell_script_build_phases.find { |x| x.name == 'Create Symlinks to Header Folders' }
#        create_symlink_phase.always_out_of_date = true # Use a boolean here instead of "1"
#      end
#    end
#  end
#end
#

# Uncomment the next line to define a global platform for your project
platform :ios, '13.1'

target 'Real Chat' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Real Chat
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'

  post_install do |installer|
    # Fix for Realm "Create Symlinks to Header Folders"
    installer.pods_project.targets.each do |target|
      if target.name == 'Realm'
        create_symlink_phase = target.shell_script_build_phases.find { |x| x.name == 'Create Symlinks to Header Folders' }
        create_symlink_phase.always_out_of_date = true
      end
    end

    # Disable warning for quoted includes in framework headers
    installer.generated_projects.each do |project|
      project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings['CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER'] = 'NO'
        end
      end
    end
  end
end
