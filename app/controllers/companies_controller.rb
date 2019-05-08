class CompaniesController < ApplicationController
  def show
    @company=Company.find(params[:id])
  end


  def destroy
    @company=Company.find(params[:id]).destroy
    redirect_to tops: :index
  end

  def edit
    @company=Company.find(params[:id])
  end

  def update
    @company=Company.find(params[:id])
    if @company.update(company_params)
      flash[:success]="プロフィールを編集しました"
      redirect_to :action => "show", :id => @company.id
    else
      render :edit
    end
  end

  private
  def company_params
    params.require(:company).permit(:name, :profile)
  end
end
