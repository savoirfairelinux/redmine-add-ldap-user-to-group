Redmine Plugin Add LDAP User to Group
=====================================

Savoir-faire Linux
------------------

Redmine plugin that **automatically adds newly logged-in LDAP users to specific group** that is configurated in plugin's settings.


Minimum system requirements
---------------------------

* GNU/Linux operating system
* Redmine ~3.2
* Ruby on Rails >= 4.2
* Ruby >= 1.9.3
* Git >= 2.1.4


Installation procedure
----------------------

We will show you how to install it on Debian family Linux distributions (such as Ubuntu), and Redmine installed with aptitude, but it can works on many other distros with similar procedures.

You may need to do those commands as root, depending on your particular case.

Feel free to replace the variable $REDMINE_PATH to your own Redmine instance path.

```bash
$REDMINE_PATH=/usr/share/redmine/

cd $REDMINE_PATH/plugins/
git clone git@github.com:savoirfairelinux/redmine-add-ldap-user-to-group.git
mv redmine-add-ldap-user-to-group redmine_add_ldap_user_to_group
rake redmine:plugins:migrate RAILS_ENV=production
service apache2 reload  # or depending on which HTTP server you use

```

After the installation, you only need to do those steps in order to configure the plugin :

`Administration` -> `Plugins` -> `Add LDAP User to Group` -> `Configure`

Once you're there you can choose the group in which you want the LDAP users automatically added on their first login and the involved LDAP source.


Contributing to this plugin
---------------------------

We absolutely appreciate patches, feel free to contribute directly on the GitHub project.

Repositories / Development website / Bug Tracker:
- https://github.com/savoirfairelinux/redmine-add-ldap-user-to-group

Do not hesitate to join us and post comments, suggestions, questions and general feedback directly on the issues tracker.

**Author :** David Côté-Tremblay <david.cote-tremblay@savoirfairelinux.com>

**Website :** https://www.savoirfairelinux.com/
