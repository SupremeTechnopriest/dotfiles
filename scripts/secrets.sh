#!/bin/sh

# Authenticate with 1Password
eval "$(op signin --session mysession)"

# Define the output file for storing secrets
SECRETS_FILE="$HOME/.zsh_secrets"

# Fetch all fields (excluding `notesPlain`) and write them as exports
echo "# Injected secrets from 1Password" > "$SECRETS_FILE"
op item get "Environment" --format=json | jq -r '.fields[] | select(.id != "notesPlain") | "export " + .label + "=\"" + .value + "\""' >> "$SECRETS_FILE"

# Ensure the secrets file is secure
chmod 600 "$SECRETS_FILE"

# Append source command to .zshrc if not already present
if ! grep -q "source $SECRETS_FILE" "$HOME/.zshrc"; then
    echo "\n# Load injected secrets\nsource $SECRETS_FILE" >> "$HOME/.zshrc"
fi

echo "Secrets have been injected into $SECRETS_FILE and will be sourced in .zshrc."
