# 
# Do NOT Edit the Auto-generated Part!
# Generated by: spectacle version 0.24.1
# 

Name:       lipstick-jolla-home

# >> macros
# << macros

Summary:    Jolla homescreen for lipstick
Version:    0.0.5
Release:    1
Group:      System/GUI/Other
License:    BSD
URL:        https://bitbucket.org/jolla/lipstick-jolla-home
Source0:    %{name}-%{version}.tar.bz2
Source1:    lipstick.desktop
Source2:    lipstick.service
BuildRequires:  pkgconfig(QtCore)
BuildRequires:  pkgconfig(QtDeclarative)
BuildRequires:  pkgconfig(QtOpenGL)
BuildRequires:  pkgconfig(lipstick)
Requires:   jollacomponents
Conflicts:  meegotouch-home
Conflicts:  lipstick-example-home

%description
A homescreen for Jolla Mobile


%prep
%setup -q -n %{name}-%{version}

# >> setup
# << setup

%build
# >> build pre
# << build pre

%qmake 

make %{?jobs:-j%jobs}

# >> build post
# << build post

%install
rm -rf %{buildroot}
# >> install pre
# << install pre
%qmake_install
mkdir -p %{buildroot}%{_libdir}/systemd/user/
cp -a %{SOURCE2} %{buildroot}%{_libdir}/systemd/user/

# >> install post
install -D -m 644 %{SOURCE1} %{buildroot}/etc/xdg/autostart/lipstick.desktop
# << install post


%files
%defattr(-,root,root,-)
%{_bindir}/lipstick
%{_libdir}/systemd/user/lipstick.service
%config /etc/xdg/autostart/*.desktop
