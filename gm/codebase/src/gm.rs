use anyhow::Result;
use home::home_dir;
use lazy_static::lazy_static;
use reqwest::Client;
use serde_derive::{Deserialize, Serialize};
use spinners_rs::{Spinner, Spinners};
use std::error::Error;
use std::path::PathBuf;
use std::str;
use std::{fs, process};
use yansi::Paint;

lazy_static! {
    static ref CONFIG_PATH: PathBuf =
        PathBuf::from(format!("{}/.gm/config.json", home_dir().unwrap().display()));
    static ref GM: Paint<&'static str> = Paint::cyan(
        r#"
                                 ___
                              .'/   \
              __  __   ___   / /     \
      .--./) |  |/  `.'   `. | |     |
     /.''\\  |   .-.  .-.   '| |     |
    | |  | | |  |  |  |  |  ||/`.   .'
     \`-' /  |  |  |  |  |  | `.|   |
     /("'`   |  |  |  |  |  |  ||___|
     \ '---. |  |  |  |  |  |  |/___/
      /'""'.\|__|  |__|  |__|  .'.--.
     ||     ||                | |    |
     \'. __//                 \_\    /
      `'---'                   `''--'
"#
    );
}

#[derive(Deserialize, Serialize)]
struct Config {
    pub commands: Vec<Command>,
}

#[derive(Deserialize, Serialize)]
struct Command {
    loading_text: String,
    command: String,
    args: Vec<String>,
}

#[derive(Deserialize, Serialize)]
struct QuoteApiResponse {
    pub author: String,
    pub content: String,
}

#[tokio::main]
async fn main() -> Result<()> {
    // Load our config
    let config = load_config()?;

    // Print GM Prompt
    println!("{}", *GM);

    // Print a random quote
    let quote = get_quote().await?;
    println!(
        "\n 👉 \"{}\" - {}\n",
        quote.content,
        Paint::cyan(quote.author)
    );

    // Run commands
    for command in config.commands {
        run_command(command.loading_text, command.command, command.args);
    }

    // Exit
    println!("\n{} Have a good day!", Paint::cyan("🎉 Done!"));
    Ok(())
}

/// Run a command and display a spinner while it is running
fn run_command(message: String, command: String, args: Vec<String>) {
    let mut sp = Spinner::new(Spinners::Aesthetic, Paint::green(message));
    sp.start();
    if let Err(err) = process::Command::new(command).args(args).output() {
        print_error_message(err);
    };
    sp.stop();
}

/// Attempt to load the GM config
fn load_config() -> Result<Config> {
    let config_content =
        fs::read_to_string(CONFIG_PATH.as_path()).expect("Missing config at \"~/.gm/config.json\"");
    let config: Config = serde_json::from_str(&config_content)?;
    Ok(config)
}

/// Grab a random quote from the quotable API
async fn get_quote() -> Result<QuoteApiResponse> {
    let client = Client::new();
    let res = client.get("http://api.quotable.io/random").send().await?;
    let quote: QuoteApiResponse = serde_json::from_slice(&res.bytes().await?)?;
    Ok(quote)
}

/// Print an error message
fn print_error_message<T: Error>(err: T) -> ! {
    eprintln!("\n\n{}", Paint::red("Uh oh! An error occurred:"));
    eprintln!("{}", err);
    process::exit(1)
}
