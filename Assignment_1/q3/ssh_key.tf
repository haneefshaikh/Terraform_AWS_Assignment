#Key Pair to Access EC2
resource "aws_key_pair" "cloudethix-key-pair" {
  key_name   = "3Tier-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDkc/q0xTIzecyMPE/sjWmR9g8sP8/Xj7itL9kXRzHtYLT3T13E2OAfVCt4zZ/eQIoTJuQWstL+slKG9anXKkrwKf4qF/2wxsZZ8Z9hUYV21KIGz9lDgmkueB3MKi07VyFhpBO1S2inbpjllkp0hp1AcYVOS0ulMhCC+X4y8yE5amG53/qiSLPnF0dBCa9icku0YYj6RZrjKfeL2S8uwBIMeTnPbpxn8BxkKIdjRErZjfuxASH39SYmWa7lpW3m2VReFc7t23ZjlEKFOaZWbwSK88L0EduRPV7+JbJDyCO/UxA+8E5/oJ9j9rt8/MmE1YV5Nnf8UiHrGhH3WJkMBDZN"
}