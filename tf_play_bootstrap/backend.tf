terraform {
  backend "local" { path = "./bootstrap_state/bootstrap.state" }
}