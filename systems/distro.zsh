case "$(hostname |cut -d- -f2)" in
    cb|deb|debian) plugins+=debian ;;
    red|fedora|rhel) ;;
    arch) plugins+=archlinux ;;
    slack) ;;
esac
