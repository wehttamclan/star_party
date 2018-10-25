class PartySearchController < ApplicationController
  def index
    @party_search_result = PartySearchResult.new(params[:q_find])
  end
end
