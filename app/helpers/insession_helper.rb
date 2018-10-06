module InsessionHelper
  require 'rqrcode'


  def genqr(link)
      q= "http://localhost:3000/"+ link  #handle not localhost
      @qrcode= RQRCode::QRCode.new(q, :size => 8, :level => :h)

  end

end
