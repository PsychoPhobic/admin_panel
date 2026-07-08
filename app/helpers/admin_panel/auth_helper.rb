module AdminPanel
  module AuthHelper
    def admin_sign_out_path(**options)
      opts = { locale: I18n.locale }.merge(options)
      AdminPanel::Navigation.route(self, :admin_destroy_session_path, **opts)
    end

    def navbar_current_user
      current_user if respond_to?(:current_user) && user_signed_in?
    end

    def navbar_user_display_name(user)
      if user.respond_to?(:nickname) && user.nickname.present?
        user.nickname
      elsif user.respond_to?(:public_name) && user.public_name.present?
        user.public_name
      else
        user.email
      end
    end

    def navbar_user_avatar(user, size_class: "w-8 h-8")
      if user.respond_to?(:avatar) && user.avatar.attached?
        image = user.respond_to?(:avatar_thumbnail) ? user.avatar_thumbnail : user.avatar
        image_tag image, class: "#{size_class} rounded-full object-cover", alt: navbar_user_display_name(user)
      else
        initials =
          if user.respond_to?(:initials) && user.initials.present?
            user.initials
          else
            navbar_user_display_name(user).to_s.first(2).upcase
          end

        content_tag(
          :div,
          initials,
          class: "#{size_class} rounded-full flex items-center justify-center bg-primary-600 text-white text-xs font-semibold",
          title: navbar_user_display_name(user)
        )
      end
    end
  end
end
