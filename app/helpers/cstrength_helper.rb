module CstrengthHelper
  def todays_cstrength
    idx = Date.today.yday % 24
    Cstrength.find(idx)
  end
end
