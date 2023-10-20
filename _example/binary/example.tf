provider "aws" {
  region = local.region
}

locals {
  region      = "eu-west-1"
  name        = "secrets_manager"
  environment = "test"
}

module "secrets_manager" {

  source      = "../../"
  name        = local.name
  environment = local.environment

  secrets = [
    {
      name          = "secret-binary-1"
      description   = "This is a binary secret"
      secret_binary = "ssh-rsa /+ZHJ4gx0gB8yQ/JWPhG1Xi2AWrMqfkidHOh5cp/H+sXYAY8nHzRFfirfSk8o8i4WIlq/vSgD47xHID0JqOOugkN96fBY4/PbvoI6UfPFDGQxfE7LaqGsPf2QZcEJlYxK3f+io/uHDKrq6Q5KnZw2+DdsBxuDfM1BlJqoWRfmcB9wKPWBvm9xMUVm8T2BIcwWikgNuzssy6p63ab7HOzCyl4i7y8V4v8ouIHDM5QA29oVLHz40Nc0JS6ahVQta4JEOHUTf3hgvw9vCAWyyjlJScLSPyQtLXTuBh2FbtG9YouiDv1SszFHStYPvWdq+6CQY5bWfzqyVXZ9lqQhHUkOaW0FJbGGfBMmwQ5WO15925OF53YgtltwSBb9SIF4k9fHjDJ9YUr4bSiIB6oDwoJmWGjS9eI8pxdTAgJ4+IXj+F/Q+AxtDiRsSUKRp2EhIoxxpy+xXMZjGyMDCSLtntzu8yF3SMiZewpR7dWZ8PzDWY7hei3M6kH6BNAy0SX9GRbT3JwGar3OilqZOoCfjjDcakgFDc1vcZnHwBarXnXP520D1hXxP+TCiemAhcFugp7FHAQdhs4+cYk3hJexpU3+SQxizoSkmd7JszO5YlJUtd9k93Q4wWnTk4rmukIJWFsGX8R9Uhb14J0mWDZAvuldnpaO3ASInl2o7r8CvQGcAavnAhBOWHs6AoSUX4ZMG0pk41sM7r7EgKsPG2J5aCpnI9Ht1od7UGaCBtcQv2yZVWrGT1yRJVwGi5Fk+IemFqbIzd5I1HldZvouvQ7Qy5Ezba2y8aYbKY9bvA4nqcCH9eA38671+Ykho/3LpZ5tLt120XGnBfMhMqNtHewzhtdv4y39iEFa+AFa5MXxx7uJe5EcoT/z3WXGIWaC9oIOLpedhsrDyKOvrzwcQ3r+PF6cZuskAaM0j/DgAVmwFke0Iqz2Blq6BnDBmTzXS5yOqr2jebNbFQq3btM6m5zUYTRFkJ/fYBL8nujkPJtE2b1PFIPKX2SDMhIlLcH9SKxlAOxzmF7xu0LsAQENtSawcm3rIZzuBJsV2IlaBuAPP2c01k6upc6VXoMScWZ3a/RZTfmRLPiumkrsmL5xTyK8P4qohUGzPAXWz8Aq0GrHjbu7MPveXiVstFBhtVzeq5G4O2A+BqIu9Paq/lKF9AhQEaM6Ipjo8fTQ1yJIjjj6mCyL51b1cLd7NsKh50WCJBYArhV+5uUTxw9Qih+nvITHoF7q8lNfigVMaACbWqHpE0kMGPqNXhXhtXPhTkMoc4BPBS4aBaVdFqrp6cxGwVsfHOrsk8L1gzuOu8ovjgBfNdcdHGFB4D9joJ test-ssh-key"
    },
    {
      name                    = "secret-binary-2"
      description             = "Another binary secret"
      secret_binary           = "ssh-rsa /+ZHJ4gx0gB8yQ/JWPhG1Xi2AWrMqfkidHOh5cp/H+/vSgD47xHID0JqOOugkN96fBY4/PbvoI6UfPFDGQxfE7LaqGsPf2QZcEJlYxK3f+io/uHDKrq6Q5KnZw2+DdsBxuDfM1BlJqoWRfmcB9wKPWBvm9xMUVm8T2BIcwWikgNuzssy6p63ab7HOzCyl4i7y8V4v8ouIHDM5QA29oVLHz40Nc0JS6ahVQta4JEOHUTf3hgvw9vCAWyyjlJScLSPyQtLXTuBh2FbtG9YouiDv1SszFHStYPvWdq+6CQY5bWfzqyVXZ9lqQhHUkOaW0FJbGGfBMmwQ5WO15925OF53YgtltwSBb9SIF4k9fHjDJ9YUr4bSiIB6oDwoJmWGjS9eI8pxdTAgJ4+IXj+F/Q+AxtDiRsSUKRp2EhIoxxpy+xXMZjGyMDCSLtntzu8yF3SMiZewpR7dWZ8PzDWY7hei3M6kH6BNAy0SX9GRbT3JwGar3OilqZOoCfjjDcakgFDc1vcZnHwBarXnXP520D1hXxP+TCiemAhcFugp7FHAQdhs4+cYk3hJexpU3+SQxizoSkmd7JszO5YlJUtd9k93Q4wWnTk4rmukIJWFsGX8R9Uhb14J0mWDZAvuldnpaO3ASInl2o7r8CvQGcAavnAhBOWHs6AoSUX4ZMG0pk41sM7r7EgKsPG2J5aCpnI9Ht1od7UGaCBtcQv2yZVWrGT1yRJVwGi5Fk+IemFqbIzd5I1HldZvouvQ7Qy5Ezba2y8aYbKY9bvA4nqcCH9eA38671+Ykho/3LpZ5tLt120XGnBfMhMqNtHewzhtdv4y39iEFa+AFa5MXxx7uJe5EcoT/z3WXGIWaC9oIOLpedhsrDyKOvrzwcQ3r+PF6cZuskAaM0j/DgAVmwFke0Iqz2Blq6BnDBmTzXS5yOqr2jebNbFQq3btM6m5zUYTRFkJ/fYBL8nujkPJtE2b1PFIPKX2SDMhIlLcH9SKxlAOxzmF7xu0LsAQENtSawcm3rIZzuBJsV2IlaBuAPP2c01k6upc6VXoMScWZ3a/RZTfmRLPiumkrsmL5xTyK8P4qohUGzPAXWz8Aq0GrHjbu7MPveXiVstFBhtVzeq5G4O2A+BqIu9Paq/lKF9AhQEaM6Ipjo8fTQ1yJIjjj6mCyL51b1cLd7NsKh50WCJBYArhV+5uUTxw9Qih+nvITHoF7q8lNfigVMaACbWqHpE0kMGPqNXhXhtXPhTkMoc4BPBS4aBaVdFqrp6cxGwVsfHOrsk8L1gzuOu8ovjgBfNdcdHGFB4D9joJ test-ssh-key-2"
      recovery_window_in_days = 7
    }
  ]
}
