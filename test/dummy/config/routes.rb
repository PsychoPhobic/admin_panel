Rails.application.routes.draw do
  mount AdminPanel::Engine => "/admin_panel"
end
