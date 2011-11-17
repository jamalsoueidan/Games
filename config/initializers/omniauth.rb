require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, '2ECv3dt6WSAw01rj1OX0A', '1mbKp47H6KMLtddhf0ct9nX1TcJWxpXRuEerK5Cggw'
  provider :facebook, '317584588267521', '1300417f35c090abfe0080efd8136227', {:scope => 'email, offline_access'}
  provider :linked_in, 'dkwf0xra1gs0', 'ZmcAqtnlPQQk7cvZ'  
 
  # generic openid
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'openid'
  
  # dedicated openid
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
  # provider :google_apps, OpenID::Store::Filesystem.new('./tmp'), :name => 'google_apps'
  # /auth/google_apps; you can bypass the prompt for the domain with /auth/google_apps?domain=somedomain.com
  
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'yahoo', :identifier => 'yahoo.com' 
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'aol', :identifier => 'openid.aol.com'
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'myopenid', :identifier => 'myopenid.com'

end