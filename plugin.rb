# name: anonymous-copy-groups
# about: A basic plugin to naively copy a user's groups to their anonymous users
# version: 0.0.1
# authors: Jacob Mischka <jmischka@mcw.edu>

enabled_site_setting :anonymous_copy_groups_enabled

module AnonymousCopyGroupsShadowCreator
	private

	def create_shadow!
		shadow = super

		for group in user.groups do
			group.add(shadow)
		end

		shadow
	end
end

class ::AnonymousShadowCreator
	prepend AnonymousCopyGroupsShadowCreator
end
