ChefSolo
========

This is a bare minimum Vagrant project that creates a single page web app. The main purpose is to demonstrate
how a working project can be created with minimum set of recipes.

App is deployed using Chef Solo. It will install apache and php5 and create/enable a virtual host which can be
accessed via http://mytest.wrk/ It should display the output of `phpinfo()` function

Details
-------

This app uses two standard Opscode cookbooks:
* `apt` cookbook provides means for updating the apt cache and adding package repositories if needed;
* `apache2` cookbook provides means for creating virtual hosts.

There's also a custom cookbook named mytest.wrk, which actually installs the app.

How to keep the list of cookbooks short
---------------------------------------

In general, use `package` resource to install software packages, for example, you can install php by simply adding
this code to your recipe:
    package "php5" do
        action "install"
    end

You don't need to include recipes unless you want something more complicated than just installing a package.
For example, `php` package helps in managing pear channels and installing pear packages and `apache2` package
helps creating apache configuration files and enabling/disabling virtual hosts.
