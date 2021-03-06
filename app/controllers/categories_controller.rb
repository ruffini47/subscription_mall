class CategoriesController < ApplicationController
  before_action :set_category, only: [:like_lunch, :edit, :update, :destroy]

  def index
    @categories = Category.where.not(name: nil)
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @categories = Category.where.not(name: nil)
  end

  def like_lunch
  end

  def shop_list
    @subscriptions = Subscription.all
  end

  def recommend
    @subscriptions = Subscription.where(monthly_fee: "19800").order(created_at: :desc).limit(15)
  end

  def washoku
    @subscriptions = Subscription.order("RAND()").where(category_name: "和食")
  end

  def teishoku
    @subscriptions = Subscription.order("RAND()").where(category_genre: "定食屋")
  end

  def ramen
    @subscriptions = Subscription.order("RAND()").where(category_genre: "らーめん")
  end

  def cafe
    @subscriptions = Subscription.order("RAND()").where(category_genre: "カフェ")
  end

  def pan
    @subscriptions = Subscription.order("RAND()").where(category_genre: "パン屋")
  end

  def izakaya
    @subscriptions = Subscription.order("RAND()").where(category_genre: "居酒屋")
  end

  def itarian
    @subscriptions = Subscription.order("RAND()").where(category_name: "イタリアン")
  end

  def chuuka
    @subscriptions = Subscription.order("RAND()").where(category_name: "中華")
  end

  def french
    @subscriptions = Subscription.order("RAND()").where(category_name: "フレンチ")
  end

  def hawaian
    @subscriptions = Subscription.order("RAND()").where(category_name: "ハワイアン")
  end

  def tonanajia
    @subscriptions = Subscription.order("RAND()").where(category_name: "東南アジア料理")
  end

  def bar
    @subscriptions = Subscription.order("RAND()").where(category_genre: "BAR")
  end

  def cake
    @subscriptions = Subscription.order("RAND()").where(category_genre: "ケーキ")
  end

  def yakiniku
    @subscriptions = Subscription.order("RAND()").where(category_genre: "焼肉")
  end

  def yoshoku
    @subscriptions = Subscription.order("RAND()").where(category_name: "洋食")
  end

  def curry
    @subscriptions = Subscription.order("RAND()").where(category_genre: "カレー")
  end

  def humburger
    @subscriptions = Subscription.order("RAND()").where(category_genre: "バーガー")
  end

  def kankokuryori
    @subscriptions = Subscription.order("RAND()").where(category_name: "韓国料理")
  end

  def restaurant
    @subscriptions = Subscription.order("RAND()").where(category_genre: "レストラン")
  end

  def other
    @subscriptions = Subscription.order("RAND()").where(category_name: "その他")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :image_category, :user_id, :owner_id)
    end
end
