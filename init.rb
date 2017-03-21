#
#    Copyright (C) 2014 Savoir-faire Linux Inc. (<www.savoirfairelinux.com>).
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

require 'redmine'
require 'add_ldap_user_to_group_user'

Redmine::Plugin.register :redmine_add_ldap_user_to_group do

    name 'Redmine Add LDAP User to Group'
    author 'Savoir-faire Linux'
    description 'Automatically add newly logged-in LDAP user to a specific group.'
    version '0.1.0'
    url 'https://github.com/savoirfairelinux/redmine-add-ldap-user-to-group'
    author_url 'https://www.savoirfairelinux.com'

    settings :default => {
        :group_id => nil,
        :ldapsource_id => nil
    }, :partial => 'add_ldap_user_to_group_settings'

end
