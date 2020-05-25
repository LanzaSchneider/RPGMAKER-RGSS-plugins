# By Lanza Schneider
# VA Screen Shake Advance
class Spriteset_Map
  def update_viewports
    @viewport1.tone.set($game_map.screen.tone)
    @viewport1.ox = (-1) ** rand(2) * $game_map.screen.shake
    @viewport1.oy = (-1) ** rand(2) * $game_map.screen.shake
    @viewport2.color.set($game_map.screen.flash_color)
    @viewport3.color.set(0, 0, 0, 255 - $game_map.screen.brightness)
    @viewport1.update
    @viewport2.update
    @viewport3.update
  end
end
