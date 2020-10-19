class ApplicationController < ActionController::Base

  private

  def render_403
    render file: "public/403.html", status: 403
  end

  def render_404
    render file: "public/404.html", status: 404
  end

  def check_if_registered
    render_403 unless current_user
  end

end
