Pod::Spec.new do |s|
  s.name         = "BBFoundation"
  s.version      = "0.0.5"
  s.summary      = "咖品汇iOS开发框架"
  s.homepage     = "https://github.com/CupinnCoder/BBFoundation"
  s.license      = "Copyright (C) 2015 Cupinn, Inc.  All rights reserved."
  s.author             = { "zhuguanyu" => "zhuguanyu@cupinn.com" }
  s.social_media_url   = "http://www.cupinn.com"
  s.ios.deployment_target = "7.1"
  s.source       = { :git => "/Item/Project/OpenSourceCode/BBFoundation"}
  s.source_files  = "BBFoundation/BBFoundation/**/**/**/*.{h,m,c,txt}"
  s.requires_arc = true
  s.dependency 'SDWebImage'
  s.dependency 'DateTools'
  s.dependency 'JTCalendar'
  s.dependency 'PINRemoteImage'
  s.dependency 'GKFadeNavigationController'
  s.dependency 'JSONModel'
  s.dependency 'SSKeychain'
  s.dependency 'pop'
  s.dependency 'AFNetworking'
  s.dependency 'RETableViewManager'
  s.dependency 'HHRouter'
  s.dependency 'JDStatusBarNotification'
  s.dependency 'NJKWebViewProgress'
  s.dependency 'GPUImage'
  s.dependency 'EGOCache'
  s.dependency 'ActionSheetPicker-3.0'
  s.dependency 'Masonry'
  s.dependency 'SVProgressHUD'
  s.dependency 'FMDB'
  s.dependency 'AnimatedGIFImageSerialization'
end
