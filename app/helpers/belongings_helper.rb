# frozen_string_literal: true

module BelongingsHelper
  def status_icon(b_class)
    case b_class.value.to_sym
    when :good
      '<i class="fa-solid fa-check icon-good" style="color: #fdfdfd;"></i>'.html_safe
    when :demadged
      '<i class="fa-solid fa-hammer icon-repair" style="color: #fdfdfd;"></i>'.html_safe
    else
      '<i class="fa-solid fa-exclamation icon-replacement" style="color: #fdfdfd;"></i>'.html_safe
    end
  end
end
