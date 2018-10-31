class PartySearchController < ApplicationController
  def index
    @party_search_result = PartySearchResult.new(params[:q_find])
    if @party_search_result.parties == []
      flash[:notice] = "No parties found near #{params[:q_find]}. Try another search!"
      redirect_to "/"
    end
  end
end
