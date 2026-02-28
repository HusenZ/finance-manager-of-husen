#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SECRETS_FILE="$ROOT_DIR/lib/core/secrets.dart"
ENV_FILE="$ROOT_DIR/.env"

if [[ -f "$ENV_FILE" ]]; then
  set -a
  # shellcheck disable=SC1090
  source "$ENV_FILE"
  set +a
fi

required_vars=(
  RAZORPAY_KEY_ID
  RAZORPAY_KEY_SECRET
  RAZORPAY_PLAN_PRO_MONTHLY
  RAZORPAY_PLAN_PRO_ANNUAL
  RAZORPAY_PLAN_PREMIUM_MONTHLY
  RAZORPAY_PLAN_PREMIUM_ANNUAL
  OWNER_UID
)

for var_name in "${required_vars[@]}"; do
  if [[ -z "${!var_name:-}" ]]; then
    echo "Missing required env var: $var_name" >&2
    exit 1
  fi
done

escape_single_quotes() {
  printf "%s" "$1" | sed "s/'/\\\\'/g"
}

cat > "$SECRETS_FILE" <<SECRETS
class Secrets {
  static const String razorpayKeyId = '$(escape_single_quotes "${RAZORPAY_KEY_ID}")';
  static const String razorpayKeySecret = '$(escape_single_quotes "${RAZORPAY_KEY_SECRET}")';
  static const String razorpayPlanIdProMonthly = '$(escape_single_quotes "${RAZORPAY_PLAN_PRO_MONTHLY}")';
  static const String razorpayPlanIdProAnnual = '$(escape_single_quotes "${RAZORPAY_PLAN_PRO_ANNUAL}")';
  static const String razorpayPlanIdPremiumMonthly = '$(escape_single_quotes "${RAZORPAY_PLAN_PREMIUM_MONTHLY}")';
  static const String razorpayPlanIdPremiumAnnual = '$(escape_single_quotes "${RAZORPAY_PLAN_PREMIUM_ANNUAL}")';
  static const String ownerUid = '$(escape_single_quotes "${OWNER_UID}")';
}
SECRETS

echo "Generated $SECRETS_FILE"
