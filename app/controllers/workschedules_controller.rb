depclass WorkschedulesController < ApplicationController

before_action :set_users_and_user, :set_statuses, :number_of_users

  def index
    # bd : business days(稼働日)
    # dobcc : day off by company circumstances(会社都合休業)
    # ws : work schedule
    if user_signed_in? && current_user.admin?#adminユーザーのindex
      @ws_thismonth = Workschedule.ws_thismonth
      @ws_lastmonth = Workschedule.ws_lastmonth
      @ws_nextmonth = Workschedule.ws_nextmonth
      @bd_thismonth = Date.today.beginning_of_month.business_days_until(Date.today.end_of_month)
      @bd_lastmonth = Date.today.last_month.beginning_of_month.business_days_until(Date.today.last_month.end_of_month)
      @bd_nextmonth = Date.today.next_month.beginning_of_month.business_days_until(Date.today.next_month.end_of_month)
      @dobcc_count_per_this_month = Workschedule.dobcc.where(wdate: Date.today.all_month).count
      @dobcc_count_per_last_month = Workschedule.dobcc.where(wdate: Date.today.last_month.all_month).count
      @dobcc_count_per_next_month = Workschedule.dobcc.where(wdate: Date.today.next_month.all_month).count
      @dobcc_ratio_in_total_this_month =  (@dobcc_count_per_this_month / (@bd_thismonth*@number_of_users).to_f).round(2)*100
      @dobcc_ratio_in_total_last_month =  (@dobcc_count_per_last_month / (@bd_lastmonth*@number_of_users).to_f).round(2)*100
      @dobcc_ratio_in_total_next_month =  (@dobcc_count_per_next_month / (@bd_nextmonth*@number_of_users).to_f).round(2)*100
      # ↓↓↓今月のdobcc
      @dobcc_count_per_this_month_per_dep_1 = Workschedule.joins(:user).dobcc.ws_thismonth.where(users:{dep_name_id:1}).size
      @dobcc_count_per_this_month_per_dep_2 = Workschedule.joins(:user).dobcc.ws_thismonth.where(users:{dep_name_id:2}).size
      @dobcc_count_per_this_month_per_dep_3 = Workschedule.joins(:user).dobcc.ws_thismonth.where(users:{dep_name_id:3}).size
      @dobcc_count_per_this_month_per_dep_4 = Workschedule.joins(:user).dobcc.ws_thismonth.where(users:{dep_name_id:4}).size
      @dobcc_count_per_this_month_per_dep_5 = Workschedule.joins(:user).dobcc.ws_thismonth.where(users:{dep_name_id:5}).size
      @dobcc_count_per_this_month_per_dep_6 = Workschedule.joins(:user).dobcc.ws_thismonth.where(users:{dep_name_id:6}).size
      @dobcc_ratio_in_total_this_month_per_dep_1 =  (@dobcc_count_per_this_month_per_dep_1 / (@bd_thismonth*@users.where(dep_name_id:1).count).to_f).round(2)*100
      @dobcc_ratio_in_total_this_month_per_dep_2 =  (@dobcc_count_per_this_month_per_dep_2 / (@bd_thismonth*@users.where(dep_name_id:2).count).to_f).round(2)*100
      @dobcc_ratio_in_total_this_month_per_dep_3 =  (@dobcc_count_per_this_month_per_dep_3 / (@bd_thismonth*@users.where(dep_name_id:3).count).to_f).round(2)*100
      @dobcc_ratio_in_total_this_month_per_dep_4 =  (@dobcc_count_per_this_month_per_dep_4 / (@bd_thismonth*@users.where(dep_name_id:4).count).to_f).round(2)*100
      @dobcc_ratio_in_total_this_month_per_dep_5 =  (@dobcc_count_per_this_month_per_dep_5 / (@bd_thismonth*@users.where(dep_name_id:5).count).to_f).round(2)*100
      @dobcc_ratio_in_total_this_month_per_dep_6 =  (@dobcc_count_per_this_month_per_dep_6 / (@bd_thismonth*@users.where(dep_name_id:6).count).to_f).round(2)*100
      # ↓↓↓先月のdobcc
      @dobcc_count_per_last_month_per_dep_1 = Workschedule.joins(:user).dobcc.ws_lastmonth.where(users:{dep_name_id:1}).size
      @dobcc_count_per_last_month_per_dep_2 = Workschedule.joins(:user).dobcc.ws_lastmonth.where(users:{dep_name_id:2}).size
      @dobcc_count_per_last_month_per_dep_3 = Workschedule.joins(:user).dobcc.ws_lastmonth.where(users:{dep_name_id:3}).size
      @dobcc_count_per_last_month_per_dep_4 = Workschedule.joins(:user).dobcc.ws_lastmonth.where(users:{dep_name_id:4}).size
      @dobcc_count_per_last_month_per_dep_5 = Workschedule.joins(:user).dobcc.ws_lastmonth.where(users:{dep_name_id:5}).size
      @dobcc_count_per_last_month_per_dep_6 = Workschedule.joins(:user).dobcc.ws_lastmonth.where(users:{dep_name_id:6}).size
      @dobcc_ratio_in_total_last_month_per_dep_1 =  (@dobcc_count_per_last_month_per_dep_1 / (@bd_lastmonth*@users.where(dep_name_id:1).count).to_f).round(2)*100
      @dobcc_ratio_in_total_last_month_per_dep_2 =  (@dobcc_count_per_last_month_per_dep_2 / (@bd_lastmonth*@users.where(dep_name_id:2).count).to_f).round(2)*100
      @dobcc_ratio_in_total_last_month_per_dep_3 =  (@dobcc_count_per_last_month_per_dep_3 / (@bd_lastmonth*@users.where(dep_name_id:3).count).to_f).round(2)*100
      @dobcc_ratio_in_total_last_month_per_dep_4 =  (@dobcc_count_per_last_month_per_dep_4 / (@bd_lastmonth*@users.where(dep_name_id:4).count).to_f).round(2)*100
      @dobcc_ratio_in_total_last_month_per_dep_5 =  (@dobcc_count_per_last_month_per_dep_5 / (@bd_lastmonth*@users.where(dep_name_id:5).count).to_f).round(2)*100
      @dobcc_ratio_in_total_last_month_per_dep_6 =  (@dobcc_count_per_last_month_per_dep_6 / (@bd_lastmonth*@users.where(dep_name_id:6).count).to_f).round(2)*100
      # ↓↓↓来月のdobcc
      @dobcc_count_per_next_month_per_dep_1 = Workschedule.joins(:user).dobcc.ws_nextmonth.where(users:{dep_name_id:1}).size
      @dobcc_count_per_next_month_per_dep_2 = Workschedule.joins(:user).dobcc.ws_nextmonth.where(users:{dep_name_id:2}).size
      @dobcc_count_per_next_month_per_dep_3 = Workschedule.joins(:user).dobcc.ws_nextmonth.where(users:{dep_name_id:3}).size
      @dobcc_count_per_next_month_per_dep_4 = Workschedule.joins(:user).dobcc.ws_nextmonth.where(users:{dep_name_id:4}).size
      @dobcc_count_per_next_month_per_dep_5 = Workschedule.joins(:user).dobcc.ws_nextmonth.where(users:{dep_name_id:5}).size
      @dobcc_count_per_next_month_per_dep_6 = Workschedule.joins(:user).dobcc.ws_nextmonth.where(users:{dep_name_id:6}).size
      @dobcc_ratio_in_total_next_month_per_dep_1 =  (@dobcc_count_per_next_month_per_dep_1 / (@bd_nextmonth*@users.where(dep_name_id:1).count).to_f).round(2)*100
      @dobcc_ratio_in_total_next_month_per_dep_2 =  (@dobcc_count_per_next_month_per_dep_2 / (@bd_nextmonth*@users.where(dep_name_id:2).count).to_f).round(2)*100
      @dobcc_ratio_in_total_next_month_per_dep_3 =  (@dobcc_count_per_next_month_per_dep_3 / (@bd_nextmonth*@users.where(dep_name_id:3).count).to_f).round(2)*100
      @dobcc_ratio_in_total_next_month_per_dep_4 =  (@dobcc_count_per_next_month_per_dep_4 / (@bd_nextmonth*@users.where(dep_name_id:4).count).to_f).round(2)*100
      @dobcc_ratio_in_total_next_month_per_dep_5 =  (@dobcc_count_per_next_month_per_dep_5 / (@bd_nextmonth*@users.where(dep_name_id:5).count).to_f).round(2)*100
      @dobcc_ratio_in_total_next_month_per_dep_6 =  (@dobcc_count_per_next_month_per_dep_6 / (@bd_nextmonth*@users.where(dep_name_id:6).count).to_f).round(2)*100
      respond_to do |format|
        format.html
        format.xlsx do
          # ファイル名をここで指定する（動的にファイル名を変更できる）
          response.headers['Content-Disposition'] = "attachment; filename=#{Date.today}.xlsx"
        end#of do
      end#of do
    end#of if
    if user_signed_in? && current_user #一般ユーザーのindex
      @week_days = ["日","月","火","水","木","金","土"]
      @ws_thismonth_na = Workschedule.where(wdate:Date.today.all_month).where(user_id: current_user.id)
      @ws_lastmonth_na = Workschedule.where(wdate:Date.today.last_month.all_month).where(user_id: current_user.id)
      @ws_nextmonth_na = Workschedule.where(wdate:Date.today.next_month.all_month).where(user_id: current_user.id)
    end#of if
  end#of def

  def nonadmin_lastmonth
    if user_signed_in? && current_user
      @week_days = ["日","月","火","水","木","金","土"]
      @workschedules_last_month = Workschedule.where(wdate: Time.current.last_month.all_month).where(user_id: current_user.id)
    end #of if
  end #of def

  def nonadmin_nextmonth
    if user_signed_in? && current_user
      @week_days = ["日","月","火","水","木","金","土"]
      @now = Time.current
      @next_month = Time.current.next_month
      @workschedules_next_month = Workschedule.where(wdate: @next_month.all_month).where(user_id: current_user.id)
    end #of if
  end #of def

  def new
    if current_user
      @workschedules = Workschedule.where(user_id: current_user.id)
      @workschedule = Workschedule.new
    else
      redirect_to root_path and return
    end
  end #of def

  def create
    @date = workschedule_params[:wdate]
    # すでに予定投入済みの日に新たに予定をいれる事を防止
    if Workschedule.where(user_id: @user.id).where(wdate: @date).any?
      flash[:danger]= "その日はすでに予定投入済みです"
      redirect_to root_path and return
    end
    if Workschedule.create(workschedule_params)
      flash[:success]= "登録できました"
      redirect_to root_path and return
    else
      flash[:danger]= "登録できませんでした"
      redirect_to '/workschedules/new' and return
    end
  end #of def

  def edit
    @workschedule = Workschedule.find(params[:id])
  end #of def

  def update
    @date = workschedule_params[:wdate]
    @workschedule = Workschedule.find(params[:id])
    if @workschedule.update(workschedule_params)
      flash[:success]= "編集できました"
      redirect_to root_path and return
    else
      flash[:danger]= "編集できませんでした"
      redirect_to new_workschedule_path and return
    end #of if
  end #of def

  def destroy
    @workschedule = Workschedule.find(params[:id])
    @workschedule.destroy
    redirect_to root_path
  end #of def

  private
      def workschedule_params
        params.require(:workschedule).permit(:wdate, :status_id).merge(user_id: current_user.id)
      end #of def

      def set_users_and_user
        @users = User.all
        @user  = current_user
      end #of def

      def set_statuses
        @statuses= Status.all
      end #of def

      def number_of_users
        @number_of_users = User.all.count-1 #アドミユーザー分マイナス
      end #of def

end #of class
