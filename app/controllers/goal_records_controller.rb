class GoalRecordsController < ApplicationController
  before_action :set_goal_record, only: [:show, :edit, :update, :destroy]

  # GET /goal_records
  # GET /goal_records.json
  def index
    @goal_records = GoalRecord.all
  end

  # GET /goal_records/1
  # GET /goal_records/1.json
  def show
  end

  # GET /goal_records/new
  def new
    @goal_record = GoalRecord.new
  end

  # GET /goal_records/1/edit
  def edit
  end

  # POST /goal_records
  # POST /goal_records.json
  def create
    @goal_record = GoalRecord.new(goal_record_params)

    respond_to do |format|
      if @goal_record.save
        format.html { redirect_to @goal_record, notice: 'Goal record was successfully created.' }
        format.json { render :show, status: :created, location: @goal_record }
      else
        format.html { render :new }
        format.json { render json: @goal_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goal_records/1
  # PATCH/PUT /goal_records/1.json
  def update
    respond_to do |format|
      if @goal_record.update(goal_record_params)
        format.html { redirect_to @goal_record, notice: 'Goal record was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal_record }
      else
        format.html { render :edit }
        format.json { render json: @goal_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goal_records/1
  # DELETE /goal_records/1.json
  def destroy
    @goal_record.destroy
    respond_to do |format|
      format.html { redirect_to goal_records_url, notice: 'Goal record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_record
      @goal_record = GoalRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_record_params
      params.require(:goal_record).permit(:name, :quantity, :goal_id, :act_id)
    end
end
