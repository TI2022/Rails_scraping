Rails.application.routes.draw do
  get 'static_pages/top'

  get 'static_pages/scraping', to: 'static_pages#scraping'
  get 'static_pages/csv', to: 'static_pages#csv'
end
