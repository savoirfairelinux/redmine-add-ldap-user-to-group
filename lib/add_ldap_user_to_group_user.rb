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

require_dependency 'user'

module AddLdapUserToGroupUser

    def self.included(base)
        base.extend(ClassMethods)
        base.class_eval do
            unloadable
            class << self
                if Rails::VERSION::MAJOR >= 5
                    alias_method :try_to_login_without_add_ldap_user_to_group, :try_to_login
                    alias_method :try_to_login, :try_to_login_with_add_ldap_user_to_group
                else
                    alias_method_chain :try_to_login, :add_ldap_user_to_group
                end
            end
        end
    end

    module ClassMethods
        def try_to_login_with_add_ldap_user_to_group(*args)
            login, = *args
            already_exists = User.exists?(:login => login)
            user = self.try_to_login_without_add_ldap_user_to_group(*args)
            return user if (
                already_exists or user.nil? or
                user.auth_source.type != 'AuthSourceLdap'
            )
            settings = Setting.plugin_redmine_add_ldap_user_to_group
            begin
                auth_source = AuthSourceLdap.find(
                    settings['ldapsource_id'].to_i
                )
                group = Group.find(settings['group_id'].to_i)
                group.users << user
                user.reload
            rescue ActiveRecord::RecordNotFound
            end
            return user
        end
    end

end

User.send(:include, AddLdapUserToGroupUser)
