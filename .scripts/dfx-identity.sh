#!/bin/bash

ALICE_HOME=$(mktemp -d)
BOB_HOME=$(mktemp -d)

export ALICE_PRINCIPAL_ID=$(HOME=$ALICE_HOME dfx identity get-principal)
export BOB_PRINCIPAL_ID=$(HOME=$BOB_HOME dfx identity get-principal)

export ALICE_PEM="$ALICE_HOME/.config/dfx/identity/default/identity.pem"
export BOB_PEM="$BOB_HOME/.config/dfx/identity/default/identity.pem"
