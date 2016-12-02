class CitiesController < ApplicationController

  def index
  end

  def subway
    stations = {
      1 => %w(Парк\ культуры Спортивная Воробьёвы\ горы),
      2 => %w(Улица\ Дыбенко Проспект\ Большевиков Ладожская),
    }

    render json: stations[params[:city_id].to_i].to_json
    # render plain: "subway"
    # head :no_content
  end
end
