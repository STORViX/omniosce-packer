# Use the first disk not assigned to a zpool already to create the data pool.
for DISK in $(cfgadm -al | awk -F\/ '/dsk/{ print $3 }' | awk '{ print $1 }'); do
  if [[ -z $(zpool list -v | ggrep -E '^\s+${DISK}') ]]; then
    echo "Adding data zpool using whole disk ${DISK}"
    zpool create data ${DISK}
    break
  fi
done

echo "Listing zpools:"
zpool list -v

echo "data-pool.sh done"
