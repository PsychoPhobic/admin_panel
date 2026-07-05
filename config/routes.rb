AdminPanel::Engine.routes.draw do
  scope "(:locale)", locale: /de|en/ do
    root "dashboard#index"
  end
end
