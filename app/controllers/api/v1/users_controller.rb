module Api
    module V1
        class UsersController < ApplicationController

            before_action :set_user, only: [:show, :update]

            def index
                @users = User.all
                render json: {status: 'SUCCESS', message: 'Loaded users', data:@users}, status: :ok
            end

            def show
                render json: {status: 'SUCCESS', message: 'User is saved', data:@user}, status: :ok
            end


            def create
                @user = User.create(user_params)
                if @user.save
                    render json: {status: 'SUCCESS', message: 'User is saved', data:@user}, status: :ok
                else
                    render json: {status: 'Error', message: 'User is not saved', data:@user.errors}, status: :unprocessable_entity
                end
            end
            

            def update
                if @user.update(user_params)
                    render json: {status: 'SUCCESS', message: 'User is updated', data:@user}, status: :ok
                else
                    render json: {status: 'Error', message: 'User is not updated', data:@user.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                @user.destroy
                render json: {status: 'SUCCESS', message: 'User successfully deleted', data:@user}, status: :ok
            end

            private

            def set_user
                @user = User.find(params[:id])
            end

            def user_params
                params.permit(:name)
            end

        end
    end
end