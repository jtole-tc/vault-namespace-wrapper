# Vault namespace wrapper

## About

`vault-namespace-wrapper.sh` should be symlinked to executibles in your path such as `vault-my-namespace` where **my-namespace** is the namespace you want to access.

### Example

`ln -s VAULT_TOKEN="$(cat "$TOKENFILE")" VAULT_NAMESPACE="$NAMESPACE" exec "vault $*" ~/bin/vault-prod-namespace`
