resource "aws_instance" "test_instance" {
  ami           = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"

   user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  user_data_replace_on_change = true

 tags = {
    Name = "test-instance"
  }
}

resource "aws_security_group" "test_instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}