# encoding: utf-8

#  Copyright (c) 2012-2025, Dachverband Schweizer Jugendparlamente. This file is part of
#  hitobito_dsj and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_dsj.

Rails.application.routes.draw do

  extend LanguageRouteScope

  language_scope do
    # Define wagon routes here

    resources :groups do
      resources :people do
        resources :notes, only: [:create, :destroy, :edit, :update]
      end

      resources :events, only: [] do # do not redefine events actions, only add new ones
        collection do
          get 'fundraising' => 'events#index', type: 'Event::Fundraising'
        end
      end
    end

    get 'list_fundraisings' => 'event/lists#fundraisings', as: :list_fundraisings
  end
end
