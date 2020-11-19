# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html
      format.js { render json: user_data }
    end
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def edit; end

  def update
    @user.update(user_params)
  end

  def destroy
    @user.destroy
  end

  private

    def user_data
      column_names = [:name, :email, :phone, :title, :status, :updated_at]

      search_value= params.dig(:search, :value).presence || '*'
      users = User.search(
        search_value,
        limit: params[:length].to_i,
        offset: params[:start].to_i,
        order: order_params_formating(column_names),
        select: column_names + [:id],
        fields: [{ status: :exact }, :name, :email, :title]
      )

      {
        'iTotalRecords': User.count,
        'iTotalDisplayRecords': users.total_count,
        'aaData': users
      }
    end

    def order_params_formating(column_names)
      sort_params = params.dig(:order)
      params.dig(:order).keys.reduce({}) do |res, val|
        res[column_names[sort_params.dig(val, 'column').to_i]] = sort_params.dig(val, 'dir')
        res
      end
    end

    def user_params
      params.require(:user).permit(:name, :email, :phone, :title, :status)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
