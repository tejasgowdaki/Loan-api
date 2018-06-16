Rails.application.routes.draw do
  # Account routes
  get '/accounts' => 'accounts#index'
  post '/fetch_members_by_account' => 'accounts#fetch_members_by_account'
  post '/accounts' => 'accounts#create'
  put '/accounts/:id' => 'accounts#update'

  # Member routes
  get '/members' => 'members#index'
  post '/fetch_accounts_by_member' => 'members#fetch_accounts_by_member'
  post '/members' => 'members#create'
  put '/members/:id' => 'members#update'

  # Saving routes
  post '/fetch_savings_by_account' => 'savings#fetch_savings_by_account'
  post '/fetch_savings_by_member' => 'savings#fetch_savings_by_member'
  post '/fetch_savings_by_account_member' => 'savings#fetch_savings_by_account_member'
  post '/savings' => 'savings#create'
  put '/savings/:id' => 'savings#update'
end
