# gpkg (gentoo package manager wrapper) usage
def gpkg [] {
    help gpkg
}

# Installs provided package. By default the package is compiled.
def "gpkg add" [
    name: string      # The name of the package to install
    --binary (-b)     # Install the pre-compiled binary instead of building from source
] {
    if $binary {
        sudo emerge --ask --verbose --getbinpkg $name
    } else {
        sudo emerge --ask --verbose $name
    }
}

# Removes the package from `@world`. Use `gpkg clean` afterwards
def "gpkg remove" [
    name: string      # The name of the package to remove
] {
    sudo emerge --ask --deselect $name
}

# Update gentoo repos
def "gpkg update" [] {
    sudo emaint --auto sync

    let news_count = (eselect news count new | into int)
    if $news_count > 0 {
        print "READ THE NEWS!"
        return
    }
}

# Upgrades all packages. Read all news before running the command (`gpkg news`)
def "gpkg upgrade" [
    --exclude (-e): string      # Exclude package from upgrading
] {
    let news_count = (eselect news count new | into int)
    if $news_count > 0 {
        print "Read news before upgrading (gpkg news)"
        return
    }

    sudo emerge --ask --oneshot sys-apps/portage
    if $exclude != null {
        sudo emerge --ask --verbose --update --deep --newuse @world --exclude $exclude
    } else {
        sudo emerge --ask --verbose --update --deep --newuse @world        
    }
}

# Cleans not needed packages. This can break the system so be careful.
def "gpkg clean" [] {
    sudo emerge --ask --depclean
}

# Reads new news
def "gpkg news" [] {
    eselect news read
}

# Lists installed packages
def "gpkg list" [] {
    qlist -IRv -F "%{CATEGORY}/%{PN} %{PVR} %{REPO}" 
        | lines 
        | parse "{package} {version} {repo}" 
        | update package { |row| 
            $"https://packages.gentoo.org/packages/($row.package)" | ansi link --text $row.package 
        }
}

