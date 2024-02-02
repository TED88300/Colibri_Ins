TED@MacBook-Pro-TED 1.0.21 % adb install iddoc-release-armeabi-v7a-pub-dex-1.0.21.apk
Performing Push Install
iddoc-release-armeabi-v7a-pub-dex-1.0.21.apk: 1 file pushed, 0 skipped. 4.1 MB/s (22395593 bytes in 5.200s)
pkg: /data/local/tmp/iddoc-release-armeabi-v7a-pub-dex-1.0.21.apk
Failure [INSTALL_FAILED_UPDATE_INCOMPATIBLE]
TED@MacBook-Pro-TED 1.0.21 %

Login 

Lecture User (res_users)
    Recup ilot_User
    
    
Liste Activités
    innoving.activite Where Ilots = ilot_User
    
Liste Entreprenants
    innoving_entreprenant Where Ilots = ilot_User ????
    
Liste Param en BD

Liste Param en Selection


autre_moyen_comptable

Null? bauxLoyer;
Null? pubLongueur;
Null? pubLargeur;

SELECT to_json(r)
FROM (SELECT * FROM public.res_partner ORDER BY id ASC LIMIT 1) r

