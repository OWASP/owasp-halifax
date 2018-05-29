angel() {
    while inotifywait -r -qq .; do
      make update
    done
}

daemon() {
    chsum1=""

    while [[ true ]]
    do
        chsum2=`find . -type f -exec md5sum {} \;`
        if [[ $chsum1 != $chsum2 ]] ; then
            make update
            chsum1=$chsum2
        fi
        sleep 2
    done
}

# Prefer to use inotify-tools if they're available.
# If not, just go with good ol' poll and sleep.
if [ -x "$(command -v inotifywait)" ]; then
  angel
else
  echo "Using less efficient poll/sleep watch. Consider installing inotify-tools."
  daemon
fi
