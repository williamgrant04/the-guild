class ModalsController < ApplicationController
  skip_after_action :verify_authorized
  def get_modal
    p params

    if params[:source] == "guild" && params[:type] == "event"
      render partial: "modals/#{params[:modal]}", locals: {
        source: Guild.find(params[:sourceid]),
        event:params[:id] == "undefined" ?  Event.new : Event.find(params[:id])
      }
      return
    elsif params[:source] == "game" && (params[:type] == "event" || params[:type] == "gamemember")
      render partial: "modals/#{params[:modal]}", locals: {
        source: Game.find(params[:sourceid]),
        "#{params[:type]}".to_sym => params[:id] == "undefined" ? $types[params[:type]].new :  $types[params[:type]].find(params[:id])
      }
      return
    end

    # For editing an existing record (has an ID)
    if params[:type] != "undefined" && params[:id] != "undefined"
      render partial: "modals/#{params[:modal]}", locals: { "#{params[:type]}".to_sym => $types[params[:type]].find(params[:id]) }
      return
    end

    # For creating a new record (does not have an ID)
    if params[:type] != "undefined" && params[:id] == "undefined"
      render partial: "modals/#{params[:modal]}", locals: { "#{params[:type]}".to_sym => $types[params[:type]].new }
      return
    end

    if params[:modal] == "undefined" && params[:id] != "undefined"
      raise "Cannot have an ID without a type"
    end

    render partial: "modals/#{params[:modal]}"
  end
end


# !This hash will have to be updated if we add more models
$types = {
  "gamemember" => GameMember,
  "event" => Event,
  "guild" => Guild,
  "game" => Game,
  "member" => Member,
  "user" => User,
  "eventmember" => EventMember
}
