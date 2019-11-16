Rails.application.routes.draw do
  mount Flaggable::Engine => "/flaggable"
end
