class InsessionController < ApplicationController
include InsessionHelper

  def started
    @master= $currentu
    @qr= genqr("fasdfsdfsdfsdfdsfsdfdssfsdafjksdba")
  end
end
