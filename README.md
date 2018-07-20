# changeAppIcon
动态修改appLOGO 主要需要将本地的图片的name配置在info.plist中，

拷贝：

 <key>CFBundleIcons</key>
 
    <dict>
    
        <key>CFBundleAlternateIcons</key>
        
        <dict>
        
            <key>appicon1</key>
            
            <dict>
            
                <key>CFBundleIconFiles</key>
                
                <array>
                
                    <string>appicon1</string>
                    
                </array>
                
                <key>UIPrerenderedIcon</key>
                
                <false/>
                
            </dict>
            
          
      #    。。。。。。。。。。
