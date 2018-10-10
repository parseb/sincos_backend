module InsessionHelper
  require 'rqrcode'
  require 'digest'

  def genqr(sesaut, uauth)
      t = sesaut.to_s + uauth.to_s
      temp= Digest::SHA256.hexdigest t
      #print temp
      @jcode = temp[0,8]
      q= "http://localhost:3000/"+ temp[0,8]   #handle not localhost || not hardcoded
      @qr= RQRCode::QRCode.new(q, :size => 8, :level => :h)
  end

  def setsession(code)
    if @hassession
      @session= Session.find_by(auth: @hassession) #....
    else
      @insession= Sessionrecord.find_by(auth: code)
      @session= @insession.session
    end
  end

end
