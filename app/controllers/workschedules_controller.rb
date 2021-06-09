class WorkschedulesController < ApplicationController

before_action :set_users_and_user, :set_statuses, :number_of_users, :set_calendar, :set_users_per_dep, :set_weekdays

  def index
    # bd : business days(稼働日)
    # dobcc : day off by company circumstances(会社都合休業)
    # ws : work schedule
    if user_signed_in? && current_user.admin?#adminユーザーのindex
      # ↓↓↓　月毎の全体勤務予定
      @ws_thismonth = Workschedule.ws_thismonth
      @ws_lastmonth = Workschedule.ws_lastmonth
      @ws_nextmonth = Workschedule.ws_nextmonth
      # ↓↓↓　月毎の稼働日
      @bd_thismonth = Date.today.beginning_of_month.business_days_until(Date.today.end_of_month)
      @bd_lastmonth = Date.today.last_month.beginning_of_month.business_days_until(Date.today.last_month.end_of_month)
      @bd_nextmonth = Date.today.next_month.beginning_of_month.business_days_until(Date.today.next_month.end_of_month)
      # ↓↓↓　月毎の会社都合休業日の数
      @dobcc_count_per_this_month = Workschedule.dobcc.ws_thismonth.count
      @dobcc_count_per_last_month = Workschedule.dobcc.ws_lastmonth.count
      @dobcc_count_per_next_month = Workschedule.dobcc.ws_nextmonth.count
      # ↓↓↓　月毎の会社都合休業日の率
      @dobcc_ratio_in_total_this_month =  sprintf("%.2f",(@dobcc_count_per_this_month / (@bd_thismonth*@number_of_users).to_f)*100)
      @dobcc_ratio_in_total_last_month =  sprintf("%.2f",(@dobcc_count_per_last_month / (@bd_lastmonth*@number_of_users).to_f)*100)
      @dobcc_ratio_in_total_next_month =  sprintf("%.2f",(@dobcc_count_per_next_month / (@bd_nextmonth*@number_of_users).to_f)*100)
      # ↓↓↓部門別今月のdobccの数
      @dobcc_count_per_this_month_per_dep_1 = Workschedule.joins(:user).dobcc.ws_thismonth.where(users:{dep_name_id:1}).size
      @dobcc_count_per_this_month_per_dep_2 = Workschedule.joins(:user).dobcc.ws_thismonth.where(users:{dep_name_id:2}).size
      @dobcc_count_per_this_month_per_dep_3 = Workschedule.joins(:user).dobcc.ws_thismonth.where(users:{dep_name_id:3}).size
      @dobcc_count_per_this_month_per_dep_4 = Workschedule.joins(:user).dobcc.ws_thismonth.where(users:{dep_name_id:4}).size
      @dobcc_count_per_this_month_per_dep_5 = Workschedule.joins(:user).dobcc.ws_thismonth.where(users:{dep_name_id:5}).size
      # ↓↓↓部門別今月のdobccの率
      @dobcc_ratio_in_total_this_month_per_dep_1 =  sprintf("%.2f",(@dobcc_count_per_this_month_per_dep_1 / (@bd_thismonth*@users.where(dep_name_id:1).count).to_f)*100)
      @dobcc_ratio_in_total_this_month_per_dep_2 =  sprintf("%.2f",(@dobcc_count_per_this_month_per_dep_2 / (@bd_thismonth*@users.where(dep_name_id:2).count).to_f)*100)
      @dobcc_ratio_in_total_this_month_per_dep_3 =  sprintf("%.2f",(@dobcc_count_per_this_month_per_dep_3 / (@bd_thismonth*@users.where(dep_name_id:3).count).to_f)*100)
      @dobcc_ratio_in_total_this_month_per_dep_4 =  sprintf("%.2f",(@dobcc_count_per_this_month_per_dep_4 / (@bd_thismonth*@users.where(dep_name_id:4).count).to_f)*100)
      @dobcc_ratio_in_total_this_month_per_dep_5 =  sprintf("%.2f",(@dobcc_count_per_this_month_per_dep_5 / (@bd_thismonth*@users.where(dep_name_id:5).count).to_f)*100)

      # ↓↓↓先月のdobcc
      @dobcc_count_per_last_month_per_dep_1 = Workschedule.joins(:user).dobcc.ws_lastmonth.where(users:{dep_name_id:1}).size
      @dobcc_count_per_last_month_per_dep_2 = Workschedule.joins(:user).dobcc.ws_lastmonth.where(users:{dep_name_id:2}).size
      @dobcc_count_per_last_month_per_dep_3 = Workschedule.joins(:user).dobcc.ws_lastmonth.where(users:{dep_name_id:3}).size
      @dobcc_count_per_last_month_per_dep_4 = Workschedule.joins(:user).dobcc.ws_lastmonth.where(users:{dep_name_id:4}).size
      @dobcc_count_per_last_month_per_dep_5 = Workschedule.joins(:user).dobcc.ws_lastmonth.where(users:{dep_name_id:5}).size
      @dobcc_ratio_in_total_last_month_per_dep_1 =  sprintf("%.2f",(@dobcc_count_per_last_month_per_dep_1 / (@bd_lastmonth*@users.where(dep_name_id:1).count).to_f)*100)
      @dobcc_ratio_in_total_last_month_per_dep_2 =  sprintf("%.2f",(@dobcc_count_per_last_month_per_dep_2 / (@bd_lastmonth*@users.where(dep_name_id:2).count).to_f)*100)
      @dobcc_ratio_in_total_last_month_per_dep_3 =  sprintf("%.2f",(@dobcc_count_per_last_month_per_dep_3 / (@bd_lastmonth*@users.where(dep_name_id:3).count).to_f)*100)
      @dobcc_ratio_in_total_last_month_per_dep_4 =  sprintf("%.2f",(@dobcc_count_per_last_month_per_dep_4 / (@bd_lastmonth*@users.where(dep_name_id:4).count).to_f)*100)
      @dobcc_ratio_in_total_last_month_per_dep_5 =  sprintf("%.2f",(@dobcc_count_per_last_month_per_dep_5 / (@bd_lastmonth*@users.where(dep_name_id:5).count).to_f)*100)

      # ↓↓↓来月のdobcc
      @dobcc_count_per_next_month_per_dep_1 = Workschedule.joins(:user).dobcc.ws_nextmonth.where(users:{dep_name_id:1}).size
      @dobcc_count_per_next_month_per_dep_2 = Workschedule.joins(:user).dobcc.ws_nextmonth.where(users:{dep_name_id:2}).size
      @dobcc_count_per_next_month_per_dep_3 = Workschedule.joins(:user).dobcc.ws_nextmonth.where(users:{dep_name_id:3}).size
      @dobcc_count_per_next_month_per_dep_4 = Workschedule.joins(:user).dobcc.ws_nextmonth.where(users:{dep_name_id:4}).size
      @dobcc_count_per_next_month_per_dep_5 = Workschedule.joins(:user).dobcc.ws_nextmonth.where(users:{dep_name_id:5}).size
      @dobcc_ratio_in_total_next_month_per_dep_1 =  sprintf("%.2f",(@dobcc_count_per_next_month_per_dep_1 / (@bd_nextmonth*@users.where(dep_name_id:1).count).to_f)*100)
      @dobcc_ratio_in_total_next_month_per_dep_2 =  sprintf("%.2f",(@dobcc_count_per_next_month_per_dep_2 / (@bd_nextmonth*@users.where(dep_name_id:2).count).to_f)*100)
      @dobcc_ratio_in_total_next_month_per_dep_3 =  sprintf("%.2f",(@dobcc_count_per_next_month_per_dep_3 / (@bd_nextmonth*@users.where(dep_name_id:3).count).to_f)*100)
      @dobcc_ratio_in_total_next_month_per_dep_4 =  sprintf("%.2f",(@dobcc_count_per_next_month_per_dep_4 / (@bd_nextmonth*@users.where(dep_name_id:4).count).to_f)*100)
      @dobcc_ratio_in_total_next_month_per_dep_5 =  sprintf("%.2f",(@dobcc_count_per_next_month_per_dep_5 / (@bd_nextmonth*@users.where(dep_name_id:5).count).to_f)*100)
      # 今月の出社率
      @in_the_office_count_per_this_month_per_dep_1 = Workschedule.joins(:user).in_the_office.ws_thismonth.where(users:{dep_name_id:1}).size
      @in_the_office_ratio_per_this_month_per_dep_1 = sprintf("%.2f",(@in_the_office_count_per_this_month_per_dep_1/(@bd_thismonth*@number_of_users_dep_1).to_f)*100)
      @in_the_office_count_per_this_month_per_dep_2 = Workschedule.joins(:user).in_the_office.ws_thismonth.where(users:{dep_name_id:2}).size
      @in_the_office_ratio_per_this_month_per_dep_2 = sprintf("%.2f",(@in_the_office_count_per_this_month_per_dep_2/(@bd_thismonth*@number_of_users_dep_2).to_f)*100)
      @in_the_office_count_per_this_month_per_dep_3 = Workschedule.joins(:user).in_the_office.ws_thismonth.where(users:{dep_name_id:3}).size
      @in_the_office_ratio_per_this_month_per_dep_3 = sprintf("%.2f",(@in_the_office_count_per_this_month_per_dep_3/(@bd_thismonth*@number_of_users_dep_3).to_f)*100)
      @in_the_office_count_per_this_month_per_dep_4 = Workschedule.joins(:user).in_the_office.ws_thismonth.where(users:{dep_name_id:4}).size
      @in_the_office_ratio_per_this_month_per_dep_4 = sprintf("%.2f",(@in_the_office_count_per_this_month_per_dep_4/(@bd_thismonth*@number_of_users_dep_4).to_f)*100)
      @in_the_office_count_per_this_month_per_dep_5 = Workschedule.joins(:user).in_the_office.ws_thismonth.where(users:{dep_name_id:5}).size
      @in_the_office_ratio_per_this_month_per_dep_5 = sprintf("%.2f",(@in_the_office_count_per_this_month_per_dep_5/(@bd_thismonth*@number_of_users_dep_5).to_f)*100)
      @in_the_office_count_per_this_month_in_total  = Workschedule.joins(:user).in_the_office.ws_thismonth.size
      @in_the_office_ratio_per_this_month_in_total  = sprintf("%.2f",(@in_the_office_count_per_this_month_in_total/(@bd_thismonth*@number_of_users).to_f)*100)
      # 先月の出社率
      @in_the_office_count_per_last_month_per_dep_1 = Workschedule.joins(:user).in_the_office.ws_lastmonth.where(users:{dep_name_id:1}).size
      @in_the_office_ratio_per_last_month_per_dep_1 = sprintf("%.2f",(@in_the_office_count_per_last_month_per_dep_1/(@bd_lastmonth*@number_of_users_dep_1).to_f)*100)
      @in_the_office_count_per_last_month_per_dep_2 = Workschedule.joins(:user).in_the_office.ws_lastmonth.where(users:{dep_name_id:2}).size
      @in_the_office_ratio_per_last_month_per_dep_2 = sprintf("%.2f",(@in_the_office_count_per_last_month_per_dep_2/(@bd_lastmonth*@number_of_users_dep_2).to_f)*100)
      @in_the_office_count_per_last_month_per_dep_3 = Workschedule.joins(:user).in_the_office.ws_lastmonth.where(users:{dep_name_id:3}).size
      @in_the_office_ratio_per_last_month_per_dep_3 = sprintf("%.2f",(@in_the_office_count_per_last_month_per_dep_3/(@bd_lastmonth*@number_of_users_dep_3).to_f)*100)
      @in_the_office_count_per_last_month_per_dep_4 = Workschedule.joins(:user).in_the_office.ws_lastmonth.where(users:{dep_name_id:4}).size
      @in_the_office_ratio_per_last_month_per_dep_4 = sprintf("%.2f",(@in_the_office_count_per_last_month_per_dep_4/(@bd_lastmonth*@number_of_users_dep_4).to_f)*100)
      @in_the_office_count_per_last_month_per_dep_5 = Workschedule.joins(:user).in_the_office.ws_lastmonth.where(users:{dep_name_id:5}).size
      @in_the_office_ratio_per_last_month_per_dep_5 = sprintf("%.2f",(@in_the_office_count_per_last_month_per_dep_5/(@bd_lastmonth*@number_of_users_dep_5).to_f)*100)
      @in_the_office_count_per_last_month_in_total  = Workschedule.joins(:user).in_the_office.ws_lastmonth.size
      @in_the_office_ratio_per_last_month_in_total  = sprintf("%.2f", (@in_the_office_count_per_last_month_in_total/(@bd_lastmonth*@number_of_users).to_f)*100)
      # 来月の出社率
      @in_the_office_count_per_next_month_per_dep_1 = Workschedule.joins(:user).in_the_office.ws_nextmonth.where(users:{dep_name_id:1}).size
      @in_the_office_ratio_per_next_month_per_dep_1 = sprintf("%.2f",(@in_the_office_count_per_next_month_per_dep_1/(@bd_nextmonth*@number_of_users_dep_1).to_f)*100)
      @in_the_office_count_per_next_month_per_dep_2 = Workschedule.joins(:user).in_the_office.ws_nextmonth.where(users:{dep_name_id:2}).size
      @in_the_office_ratio_per_next_month_per_dep_2 = sprintf("%.2f",(@in_the_office_count_per_next_month_per_dep_2/(@bd_nextmonth*@number_of_users_dep_2).to_f)*100)
      @in_the_office_count_per_next_month_per_dep_3 = Workschedule.joins(:user).in_the_office.ws_nextmonth.where(users:{dep_name_id:3}).size
      @in_the_office_ratio_per_next_month_per_dep_3 = sprintf("%.2f",(@in_the_office_count_per_next_month_per_dep_3/(@bd_nextmonth*@number_of_users_dep_3).to_f)*100)
      @in_the_office_count_per_next_month_per_dep_4 = Workschedule.joins(:user).in_the_office.ws_nextmonth.where(users:{dep_name_id:4}).size
      @in_the_office_ratio_per_next_month_per_dep_4 = sprintf("%.2f",(@in_the_office_count_per_next_month_per_dep_4/(@bd_nextmonth*@number_of_users_dep_4).to_f)*100)
      @in_the_office_count_per_next_month_per_dep_5 = Workschedule.joins(:user).in_the_office.ws_nextmonth.where(users:{dep_name_id:5}).size
      @in_the_office_ratio_per_next_month_per_dep_5 = sprintf("%.2f",(@in_the_office_count_per_next_month_per_dep_5/(@bd_nextmonth*@number_of_users_dep_5).to_f)*100)
      @in_the_office_count_per_next_month_in_total  = Workschedule.joins(:user).in_the_office.ws_nextmonth.size
      @in_the_office_ratio_per_next_month_in_total  = sprintf("%.2f",(@in_the_office_count_per_next_month_in_total/(@bd_nextmonth*@number_of_users).to_f)*100)

      # 部門毎出社率が高い日の抽出
      # 当月分
      @high_expectation_days_dep_name_id_1_thismonth = Workschedule.joins(:user)
              .ws_thismonth.in_the_office     # 今月レコードの中から出社を抽出
              .where(users:{dep_name_id:1})   # 部門1を抽出
              .group(:wdate).count            # wdateでグループにしてハッシュ化
              .select{|k,v| v > @number_of_users_dep_1 * 0.5} #hash化したvalueの中から半分以上出ている日を抽出
      @high_expectation_days_dep_name_id_2_thismonth = Workschedule.joins(:user)
              .ws_thismonth.in_the_office     # 今月レコードの中から出社を抽出
              .where(users:{dep_name_id:2})   # 部門1を抽出
              .group(:wdate).count            # wdateでグループにしてハッシュ化
              .select{|k,v| v > @number_of_users_dep_2 * 0.5} #hash化したvalueの中から半分以上出ている日を抽出
      @high_expectation_days_dep_name_id_3_thismonth = Workschedule.joins(:user)
              .ws_thismonth.in_the_office     # 今月レコードの中から出社を抽出
              .where(users:{dep_name_id:3})   # 部門1を抽出
              .group(:wdate).count            # wdateでグループにしてハッシュ化
              .select{|k,v| v > @number_of_users_dep_3 * 0.5} #hash化したvalueの中から半分以上出ている日を抽出
      @high_expectation_days_dep_name_id_4_thismonth = Workschedule.joins(:user)
              .ws_thismonth.in_the_office     # 今月レコードの中から出社を抽出
              .where(users:{dep_name_id:4})   # 部門1を抽出
              .group(:wdate).count            # wdateでグループにしてハッシュ化
              .select{|k,v| v > @number_of_users_dep_4 * 0.5} #hash化したvalueの中から半分以上出ている日を抽出
      @high_expectation_days_dep_name_id_5_thismonth = Workschedule.joins(:user)
              .ws_thismonth.in_the_office     # 今月レコードの中から出社を抽出
              .where(users:{dep_name_id:5})   # 部門1を抽出
              .group(:wdate).count            # wdateでグループにしてハッシュ化
              .select{|k,v| v > @number_of_users_dep_5 * 0.5} #hash化したvalueの中から半分以上出ている日を抽出
      # 来月分
      @high_expectation_days_dep_name_id_1_nextmonth = Workschedule.joins(:user)
              .ws_nextmonth.in_the_office     # 今月レコードの中から出社を抽出
              .where(users:{dep_name_id:1})   # 部門1を抽出
              .group(:wdate).count            # wdateでグループにしてハッシュ化
              .select{|k,v| v > @number_of_users_dep_1 * 0.5} #hash化したvalueの中から半分以上出ている日を抽出
      @high_expectation_days_dep_name_id_2_nextmonth = Workschedule.joins(:user)
              .ws_nextmonth.in_the_office     # 今月レコードの中から出社を抽出
              .where(users:{dep_name_id:2})   # 部門1を抽出
              .group(:wdate).count            # wdateでグループにしてハッシュ化
              .select{|k,v| v > @number_of_users_dep_2 * 0.5} #hash化したvalueの中から半分以上出ている日を抽出
      @high_expectation_days_dep_name_id_3_nextmonth = Workschedule.joins(:user)
              .ws_nextmonth.in_the_office     # 今月レコードの中から出社を抽出
              .where(users:{dep_name_id:3})   # 部門1を抽出
              .group(:wdate).count            # wdateでグループにしてハッシュ化
              .select{|k,v| v > @number_of_users_dep_3 * 0.5} #hash化したvalueの中から半分以上出ている日を抽出
      @high_expectation_days_dep_name_id_4_nextmonth = Workschedule.joins(:user)
              .ws_nextmonth.in_the_office     # 今月レコードの中から出社を抽出
              .where(users:{dep_name_id:4})   # 部門1を抽出
              .group(:wdate).count            # wdateでグループにしてハッシュ化
              .select{|k,v| v > @number_of_users_dep_4 * 0.5} #hash化したvalueの中から半分以上出ている日を抽出
      @high_expectation_days_dep_name_id_5_nextmonth = Workschedule.joins(:user)
              .ws_nextmonth.in_the_office     # 今月レコードの中から出社を抽出
              .where(users:{dep_name_id:5})   # 部門1を抽出
              .group(:wdate).count            # wdateでグループにしてハッシュ化
              .select{|k,v| v > @number_of_users_dep_5 * 0.5} #hash化したvalueの中から半分以上出ている日を抽出

      respond_to do |format|
        format.html
        format.xlsx do
          # ファイル名をここで指定する（動的にファイル名を変更できる）
          response.headers['Content-Disposition'] = "attachment; filename=#{Date.today}.xlsx"
        end#of do
      end#of do
    end#of if
    if user_signed_in? && current_user #一般ユーザーのindex
      @ws_thismonth_na = Workschedule.where(wdate:Date.today.all_month).where(user_id: current_user.id)
      @ws_lastmonth_na = Workschedule.where(wdate:Date.today.last_month.all_month).where(user_id: current_user.id)
      @ws_nextmonth_na = Workschedule.where(wdate:Date.today.next_month.all_month).where(user_id: current_user.id)
      # テスト------------------------------------------------------
      if workschedule_get_params[:wdate].nil?
        @display_type = Time.current.month
      elsif Time.parse(workschedule_get_params[:wdate]).month > Time.current.next_month.month then
        @display_type = Time.current.month
      elsif Time.parse(workschedule_get_params[:wdate]).month < Time.current.last_month.month then
        @display_type = Time.current.month
      else
        @display_type = Time.parse(workschedule_get_params[:wdate]).month
      end
      # テスト------------------------------------------------------
    end#of if
  end#of def

  def nonadmin_lastmonth
    if user_signed_in? && current_user
      @workschedules_last_month = Workschedule.where(wdate: Time.current.last_month.all_month).where(user_id: current_user.id)
    end #of if
  end #of def

  def nonadmin_nextmonth
    if user_signed_in? && current_user
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
        # redirect_to root_path(workschedule:workschedule_params) and return
        redirect_to root_path(wdate: workschedule_params[:wdate]) and return
        # redirect_to controller: 'workschedules', action: 'index', wdate: workschedule_params[:wdate] and return
    else
      flash[:danger]= "登録できませんでした"
      redirect_to '/workschedules/new' and return
    end #of if
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

      def workschedule_get_params
        # params.require(:workschedule).permit(:wdate, :status_id)
        params.permit(:wdate)
      end

      def set_users_and_user
        @users = User.all
        @user  = current_user
      end #of def

      def set_statuses
        @statuses= Status.all
      end #of def

      def set_weekdays
        @week_days = ["日","月","火","水","木","金","土"]
      end

      def number_of_users
        @number_of_users = User.all.count-1 #アドミユーザー分マイナス
        @number_of_users_dep_1 = User.where(dep_name_id:1).count
        @number_of_users_dep_2 = User.where(dep_name_id:2).count
        @number_of_users_dep_3 = User.where(dep_name_id:3).count
        @number_of_users_dep_4 = User.where(dep_name_id:4).count
        @number_of_users_dep_5 = User.where(dep_name_id:5).count
      end #of def

      def set_calendar
        @calendar_this_month = Array(Date.current.beginning_of_month..Date.current.end_of_month)
        @calendar_last_month = Array(Date.current.last_month.beginning_of_month..Date.current.last_month.end_of_month)
        @calendar_next_month = Array(Date.current.next_month.beginning_of_month..Date.current.next_month.end_of_month)
      end #of def

      def set_users_per_dep
        @dep1_users = User.where(dep_name_id:1)
      end #of def

end #of class
