#!/bin/bash

SECRETS_DIR="${HOME}/.secrets"
BASENAME="$(basename "$0")"
TOKENFILE="${SECRETS_DIR}/${BASENAME}"
NAMESPACE="$(basename "$0" | sed -e 's/^vault-//')"

if ! [[ -a "$SECRETS_DIR" && -d "$SECRETS_DIR" && -r "$SECRETS_DIR" && -w "$SECRETS_DIR" ]]
then
  mkdir -m 0700 "$SECRETS_DIR"
fi

if ! [[ -a "$TOKENFILE" && -r "$TOKENFILE" ]]
then
  vault login -namespace "$NAMESPACE" -method=ldap && cp "${HOME}/.vault-token" "$TOKENFILE"
fi

VAULT_TOKEN="$(cat "$TOKENFILE")" VAULT_NAMESPACE="$NAMESPACE" eval "vault $*"
