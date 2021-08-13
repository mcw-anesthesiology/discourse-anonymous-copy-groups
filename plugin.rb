# name: anonymous-copy-groups
# about: A basic plugin to naively copy a user's groups to their anonymous users
# version: 0.0.3
# authors: Jacob Mischka <jmischka@mcw.edu>

enabled_site_setting :anonymous_copy_groups_enabled

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
