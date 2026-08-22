# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

- Neovim node.js client `npm install -g neovim`
- Neovim python client `pip3 install pynvim` or `pip3 install --upgrade pynvim`
- Neovim ruby client `gem install neovim`

## add Codex AI

- install `curl -fsSL https://chatgpt.com/codex/install.sh | sh`
- input API key number when selected Provide your own API key
- codex configure: vim `~/.config/codex/config.toml`

```shell
model_provider = "openai"
openai_base_url = "https://xxx.xxx"
model = "gpt-5.6-sol"
model_reasoning_effort = "xhigh"
service_tier = "priority"
plan_mode_reasoning_effort = "xhigh"
allowed_approvals_reviewers = ["auto_review"]
approvals_reviewer = "auto_review"
```
