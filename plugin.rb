# name: anonymous-copy-groups
# about: A basic plugin to naively copy a user's groups to their anonymous users
# version: 0.1.0
# authors: Jacob Mischka <jmischka@mcw.edu>

enabled_site_setting :anonymous_copy_groups_enabled

after_initialize do
	module AnonymousCopyGroupsShadowCreator
		private def create_shadow!
			shadow = super

			user.groups.each do |group|
				group.add(shadow)
			end

			shadow.reload

			shadow
		end
	end

	class ::AnonymousShadowCreator
		prepend AnonymousCopyGroupsShadowCreator
	end
end

