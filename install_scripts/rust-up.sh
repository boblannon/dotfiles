apt-get -y -q install pkg-config libssl-dev gnuplot

# install rust
curl https://sh.rustup.rs -sSf | sh

# add to path
export PATH="$HOME/.cargo/bin:$PATH"

# racer and rust-src
cargo install racer
rustup component add rust-src
