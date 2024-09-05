# Drush function to replace drush launcher. Still depends on the
# DRUSH_LAUNCHER_FALLBACK environment variable when vendor/bin/drush cannot be
# found in the git repo.
# @see https://github.com/drush-ops/drush-launcher/issues/105#issuecomment-1621097643
function drush () {
  if [ -f "$(git rev-parse --show-toplevel)/vendor/bin/drush" ]; then
    $(git rev-parse --show-toplevel)/vendor/bin/drush "$@"
  else
    "$DRUSH_LAUNCHER_FALLBACK" "$@"
  fi
}
