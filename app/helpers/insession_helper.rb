module InsessionHelper
  require 'rqrcode'


  def genqr(link)
      q= "http://localhost:3000/"+ link
      qrcode= RQRCode::QRCode.new(q, :size => 4, :level => :h)

  end

end
