# By Lanza Schneider
# VA Character anti-cover

class Sprite_Character < Sprite_Base
  ANTICOVER_OPACITY = 127       # 被遮挡部分的不透明度
  ANTICOVER_Z       = 1048576   # 绘制被遮挡部分精灵的Zindex
  
  alias :initialize_lz20200421 :initialize
  def initialize(*args)
    @anticover_sprite = Sprite.new
    initialize_lz20200421 *args
  end
  
  alias :dispose_lz20200421 :dispose
  def dispose(*args)
    dispose_lz20200421 *args
    if @anticover_sprite
      @anticover_sprite.dispose
      @anticover_sprite = nil
    end
  end
  
  alias :update_lz20200421 :update
  def update(*args)
    update_lz20200421 *args
    update_anticover
    @anticover_sprite.opacity, @anticover_sprite.z = ANTICOVER_OPACITY, ANTICOVER_Z
  end
  
  anticover_code = ''
  (Sprite.instance_methods - Sprite.methods).each do |symbol|
    symbol = symbol.to_s
    if symbol.include?('=')
      anticover_code += "@anticover_sprite.#{symbol}#{symbol.chop}\n"
    end
  end
  eval "def update_anticover\n#{anticover_code}end\n"
end
