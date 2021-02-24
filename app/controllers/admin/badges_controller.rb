class Admin::BadgesController < Admin::BaseController

  before_action :set_badge, only: %i[edit update destroy]

  def new
    @badge = Badge.new
  end

  def create
    @badge = current_user.badges.build(badge_params)
    if @badge.save!
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end    
  end

  def index
    @badges = Badge.all
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def set_badge
   @badge = Badge.find(params[:id]) 
  end

  def badge_params
    params.require(:badge).permit(:title, :image_url, :rule_type, :rule_value)
  end  
end
