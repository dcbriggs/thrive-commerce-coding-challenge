class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]

  # GET /cars or /cars.json
  def index
    # Opted against showing the owner in the index page as it will be inefficient to get this to scale
    # as the table grow. Could be done with a query that goes beyond when Rails provides out of the box
    @cars = Car.all
  end

  # GET /cars/1 or /cars/1.json
  def show
    @owner = Person.find(@car.owner_id)
    @ownership_history = CarOwner.includes(:person).where(car_id: @car.id).order(:date_of_sale)
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)


    respond_to do |format|
      if @car.save

        ownership = CarOwner.new(car_id: @car.id, person_id: params[:car][:owner_id], price: params[:car][:price], mileage_at_sale: params[:car][:mileage], date_of_sale: Date.today)

        if ownership.save
          format.html { redirect_to car_url(@car), notice: "Car was successfully created." }
          format.json { render :show, status: :created, location: @car }
        else
          @car.destroy
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: ownership.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    respond_to do |format|
      if params[:car][:owner_id] != @car.owner_id
        ownership = CarOwner.new(car_id: @car.id, person_id: params[:car][:owner_id], price: params[:car][:price], mileage_at_sale: params[:car][:mileage], date_of_sale: Date.today)

        if ownership.save
          if @car.update(car_params)
            format.html { redirect_to car_url(@car), notice: "Car was successfully updated." }
            format.json { render :show, status: :ok, location: @car }
          else
            ownership.destroy
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @car.errors, status: :unprocessable_entity }
          end
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: ownership.errors, status: :unprocessable_entity }
        end
      else
        if @car.update(car_params)
          format.html { redirect_to car_url(@car), notice: "Car was successfully updated." }
          format.json { render :show, status: :ok, location: @car }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @car.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    # An alternative to this would be to instead add a 'deleted' field to the model, set that to
    # true when this is called. Filter the show page to not show any deleted models, and the history 
    # Can either still show the ownership records or ignore them
    @car.car_owners.destroy_all
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url, notice: "Car was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:model, :make, :color, :mileage, :is_for_sale, :owner_id)
    end
end
