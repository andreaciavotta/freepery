class PublicController < ApplicationController

  def main
    @users = Account.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
        marker.lat user.latitude
        marker.lng user.longitude

    marker.picture({
              :width  => "45",
              :height => "45"
             })

    marker.infowindow user.username


    end
  end

end

