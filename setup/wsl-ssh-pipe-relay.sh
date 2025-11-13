#!/bin/bash

# System service to forward the ssh agent socket from Windows to WSL
# Source: https://sxda.io/posts/sharing-ssh-agent-wsl/#my-preferred-solution

wget -O ~/.local/bin/npiperelay.exe https://github.com/albertony/npiperelay/releases/download/v1.9.1/npiperelay_windows_amd64.exe

# create the systemd socket unit
mkdir -p ~/.config/systemd/user/
cat <<EOF > ~/.config/systemd/user/named-pipe-ssh-agent.socket
[Unit]
Description=SSH Agent provided by Windows named pipe \\.\pipe\openssh-ssh-agent

[Socket]
ListenStream=%t/ssh/ssh-agent.sock
SocketMode=0600
DirectoryMode=0700
Accept=true

[Install]
WantedBy=sockets.target
EOF

# create the systemd template unit
mkdir -p ~/.config/systemd/user/
cat <<EOF > ~/.config/systemd/user/named-pipe-ssh-agent@.service
[Unit]
Description=Proxy to Windows SSH Agent, which provides the standard named pipe (Win32-OpenSSH, 1Password, KeeAgent, etc.)
Requires=named-pipe-ssh-agent.socket

[Service]
Type=simple
ExecStart=%h/.local/bin/npiperelay.exe -p -l -ei -s '//./pipe/openssh-ssh-agent'
StandardInput=socket

[Install]
WantedBy=default.target
EOF

# Note: Make sure the following export is in zsh config (wsl.zsh):
# export SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}ssh/ssh-agent.sock

systemctl daemon-reload --user
systemctl enable --user --now named-pipe-ssh-agent.socket
systemctl status --user named-pipe-ssh-agent.socket
ssh-add -l
