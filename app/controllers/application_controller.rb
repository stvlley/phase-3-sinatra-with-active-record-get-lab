class ApplicationController < Sinatra::Base

  set default_content_type: "application/json"

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    resp = Bakery.find(params[:id])
    resp.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    resp = BakedGood.all.sort_by(&:price).reverse
    resp.to_json
  end

  get '/baked_goods/most_expensive' do
    resp = BakedGood.all.sort_by(&:price).reverse.first
    resp.to_json
  end


end
