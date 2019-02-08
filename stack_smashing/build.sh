arg1="$1"

echo
sh build_tools/att.sh $arg1
sh build_tools/intel.sh $arg1
echo [ DONE ]
echo
