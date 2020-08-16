set -e

ME=$(basename $0)

echo >&3 "$ME: PHP7-FPM: Starting..."

php-fpm7
_retval=$?

if [[ $_retval == 0 ]]; then
  echo >&3 "$ME: PHP7-FPM: Started"
  exit 0
else
  echo >&3 "$ME: PHP7-FPM: returned non-zero exit code: $_retval"
  exit 1
fi

exit 1
