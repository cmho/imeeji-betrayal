class RunController < ActionController::Base
    def index
        @runs = Run.all
    end

    def show
        @run = Run.find(params[:id])
        @locations = Location.all.order("name ASC")
    end

    def new
        @run = Run.new
    end

    def create
        @run = Run.new({name: params[:run][:name], character_ids: params[:run][:character_ids]})
        @run.save!
        redirect_to :root
    end

    def edit
        @run = Run.find(params[:id])
    end

    def update
        @run = Run.find(params[:run][:id].to_i)
        @run.character_ids = params[:run][:character_ids].reject!{|r| r.nil? || r.strip.empty? }.map!{|x| x.to_i }
        @run.update_attributes!({name: params[:run][:name]})
        redirect_to :root
    end

    def change_location
        @char = Character.find(params[:char_id])
        @char.update_attributes!({location_id: params[:loc_id]})
        @loc = Location.find(params[:loc_id])
        str = "<span class='location-name'>#{@loc.name}</span><span class='location-links'> "
        if @char.location.location_up_id
            str += " <a href='#'' class='up' data-char='#{@char.id}' data-new-loc='#{@char.location.location_up_id}'>[up]</a>"
        end
        if @char.location.location_down_id
            str += " <a href='#' class='down' data-char='#{@char.id}' data-new-loc='#{@char.location.location_down_id}'>[down]</a>"
        end
        if @char.location.location_north_id
            str += " <a href='#' class='north' data-char='#{@char.id}' data-new-loc='#{@char.location.location_north_id}'>[north]</a>"
        end
        if @char.location.location_south_id
            str += " <a href='#' class='south' data-char='#{@char.id}' data-new-loc='#{@char.location.location_south_id}'>[south]</a>"
        end
        if @char.location.location_east_id
            str += " <a href='#' class='east' data-char='#{@char.id}' data-new-loc='#{@char.location.location_east_id}'>[east]</a>"
        end
        if @char.location.location_west_id
            str += " <a href='#' class='west' data-char='#{@char.id}' data-new-loc='#{@char.location.location_west_id}'>[west]</a>"
        end
        str += "</span>"
        render plain: str
    end

    def modify_stats
        @char = Character.find(params[:char_id])
        spd_mod = params[:spd_mod].to_i+@char.cur_spd  > 8 ? 8 - @char.cur_spd : params[:spd_mod].to_i
        san_mod = params[:san_mod].to_i+@char.cur_san  > 8 ? 8 - @char.cur_san : params[:san_mod].to_i
        mgt_mod = params[:mgt_mod].to_i+@char.cur_mgt  > 8 ? 8 - @char.cur_mgt : params[:mgt_mod].to_i
        kno_mod = params[:kno_mod].to_i+@char.cur_kno  > 8 ? 8 - @char.cur_kno : params[:kno_mod].to_i
        @charrev = CharacterRevision.new({character_id: @char.id, spd_mod: spd_mod, san_mod: san_mod, mgt_mod: mgt_mod, kno_mod: kno_mod})
        spd = @char.cur_spd != 0 ? eval("@char.stat_build.spd_#{@char.cur_spd}") : "💀"
        san = @char.cur_san != 0 ? eval("@char.stat_build.san_#{@char.cur_san}") : "💀"
        mgt = @char.cur_mgt != 0 ? eval("@char.stat_build.mgt_#{@char.cur_mgt}") : "💀"
        kno = @char.cur_kno != 0 ? eval("@char.stat_build.kno_#{@char.cur_kno}") : "💀"
        if (@char.cur_spd == 0 || @char.cur_san == 0 || @char.cur_mgt == 0 || @char.cur_kno == 0)
            @char.update_attributes!({traitor: true})
        end
        @charrev.save!
        str = "<span><b>Speed:</b> #{spd}</span> <span><b>Sanity:</b> #{san}</span> <span><b>Might:</b> #{mgt}</span> <span><b>Knowledge:</b> #{kno}</span>"
        render json: {:stats_output => str, :is_traitor => @char.traitor}.to_json
    end

    def add_item
        @item = Item.new({name: params[:name], desc: params[:desc], character_id: params[:char_id]})
        @item.save!
        str = "<li><b>#{@item.name} <a href='#' class='discard' data-item='#{@item.id}'>[x]</a></b><div>#{@item.desc}</div></li>"
        render plain: str
    end

    def discard_item
        @item = Item.find(params[:item])
        @item.delete
    end

    def reset_locations
        @run = Run.find(params[:run_id])
        @run.characters.each do |char|
            char.update_attributes!({location_id: char.unit.location_id})
        end
        render plain: "Done!"
    end

    def reset_traitors
        @run = Run.find(params[:run_id])
        @run.characters.each do |char|
            if char.traitor?
                CharacterRevision.where({character_id: char.id}).delete_all
            end
        end
        render plain: "Done!"
    end
end