class WorkschedulesController < ApplicationController

before_action :set_users_and_user, :set_statuses, :number_of_users

  def index
    # bd : business days(稼働日)
    # dobcc : day off by company circumstances(会社都合休業)
    # ws : work schedule
    if user_signed_in? && current_user.admin?#adminユーザーのindex
      @ws_thismonth = Workschedule.where(wdate: Date.today.all_month)#all_month メソッドで今月としての範囲を取得
      @ws_lastmonth = Workschedule.where(wdate: Date.today.last_month.all_month)
      @ws_nextmonth = Workschedule.where(wdate: Date.today.next_month.all_month)
      @bd_thismonth = Date.today.beginning_of_month.business_days_until(Date.today.end_of_month)
      @bd_lastmonth = Date.today.last_month.beginning_of_month.business_days_until(Date.today.last_month.end_of_month)
      @bd_nextmonth = Date.today.next_month.beginning_of_month.business_days_until(Date.today.next_month.end_of_month)
      @dobcc_count_per_this_month = Workschedule.where(status_id:3).where(wdate: Date.today.all_month).count
      @dobcc_count_per_last_month = Workschedule.where(status_id:3).where(wdate: Date.today.last_month.all_month).count
      @dobcc_count_per_next_month = Workschedule.where(status_id:3).where(wdate: Date.today.next_month.all_month).count
      @dobcc_ratio_in_total_this_month =  (@dobcc_count_per_this_month / (@bd_thismonth*@number_of_users).to_f).round(2)*100
      @dobcc_ratio_in_total_last_month =  (@dobcc_count_per_last_month / (@bd_lastmonth*@number_of_users).to_f).round(2)*100
      @dobcc_ratio_in_total_next_month =  (@dobcc_count_per_next_month / (@bd_nextmonth*@number_of_users).to_f).round(2)*100
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
    end
  end

  def nonadmin_nextmonth
    if user_signed_in? && current_user
      @week_days = ["日","月","火","水","木","金","土"]
      @now = Time.current
      @next_month = Time.current.next_month
      @workschedules_next_month = Workschedule.where(wdate: @next_month.all_month).where(user_id: current_user.id)
    end
  end

  def new
    if current_user
      @workschedules = Workschedule.where(user_id: current_user.id)
      @workschedule = Workschedule.new
    else
      redirect_to root_path and return
    end
  end

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
  end

  def edit
    @workschedule = Workschedule.find(params[:id])
  end

  def update
    @date = workschedule_params[:wdate]
    @workschedule = Workschedule.find(params[:id])
    if @workschedule.update(workschedule_params)
      flash[:success]= "編集できました"
      redirect_to root_path and return
    else
      flash[:danger]= "編集できませんでした"
      redirect_to new_workschedule_path and return
    end
  end

  def destroy
    @workschedule = Workschedule.find(params[:id])
    @workschedule.destroy
    redirect_to root_path
  end

  private
      def workschedule_params
        params.require(:workschedule).permit(:wdate, :status_id).merge(user_id: current_user.id)
      end

      def set_users_and_user
        @users = User.all
        @user  = current_user
      end

      def set_statuses
        @statuses= Status.all
      end

      def number_of_users
        @number_of_users = User.all.count-1
      end

end#of class

# memo
# wb = xlsx_package.workbook
# wb.add_worksheet(name: "output") do |sheet|
#   sheet.add_row ["No.", "日付", "ステータス" ]
#     @ws_thismonth.each_with_index do |ws, i|
#       sheet.add_row [i,
#                      ws.wdate.strftime("%Y年%m月%d日(#{@week_days[ws.wdate.wday]})"),
#                      ws.status_id ]
#   end
# end
