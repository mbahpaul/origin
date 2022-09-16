resource "aws_instance" "test_instance" {
  ami           = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"

   user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

 tags = {
    Name = "test-instance"
  }
}