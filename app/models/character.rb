class Character < ApplicationRecord
    has_and_belongs_to_many :runs
    belongs_to :stat_build
    belongs_to :unit
    belongs_to :location
    has_many :character_revisions
    has_many :items

    def cur_spd
        default = self.stat_build.spd_default
        changes = CharacterRevision.where({character_id: self.id}).map {|x| x.spd_mod }.to_enum.sum+default
        changes = [8, changes].min
        changes = [0, changes].max
        changes
    end

    def cur_san
        default = self.stat_build.san_default
        changes = CharacterRevision.where({character_id: self.id}).map {|x| x.san_mod }.to_enum.sum+default
        changes = [8, changes].min
        changes = [0, changes].max
        changes
    end

    def cur_mgt
        default = self.stat_build.mgt_default
        changes = CharacterRevision.where({character_id: self.id}).map {|x| x.mgt_mod }.to_enum.sum+default
        changes = [8, changes].min
        changes = [0, changes].max
        changes
    end

    def cur_kno
        default = self.stat_build.kno_default
        changes = CharacterRevision.where({character_id: self.id}).map {|x| x.kno_mod }.to_enum.sum+default
        changes = [8, changes].min
        changes = [0, changes].max
        changes
    end
end
