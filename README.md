<!-- This file was automatically generated by the `geine`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->

<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform AWS Secrets Manager
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    Terraform module to create an Secrets Manager resource on AWS .
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/terraform-v1.1.7-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>
<a href="https://github.com/clouddrove/terraform-aws-secrets-manager/workflows/tfsec.yml">
  <img src="https://github.com/clouddrove/terraform-aws-secrets-manager/actions/workflows/tfsec.yml/badge.svg" alt="tfsec">
</a>
<a href="https://github.com/clouddrove/terraform-aws-secrets-manager/actions/workflows/terraform.yml">
  <img src="https://github.com/clouddrove/terraform-aws-secrets-manager/actions/workflows/terraform.yml/badge.svg" alt="static-checks">
</a>


</p>
<p align="center">

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/clouddrove/terraform-aws-secrets-manager'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+AWS+Secrets+Manager&url=https://github.com/clouddrove/terraform-aws-secrets-manager'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+AWS+Secrets+Manager&url=https://github.com/clouddrove/terraform-aws-secrets-manager'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>


We eat, drink, sleep and most importantly love **DevOps**. We are working towards strategies for standardizing architecture while ensuring security for the infrastructure. We are strong believer of the philosophy <b>Bigger problems are always solved by breaking them into smaller manageable problems</b>. Resonating with microservices architecture, it is considered best-practice to run database, cluster, storage in smaller <b>connected yet manageable pieces</b> within the infrastructure. 

This module is basically combination of [Terraform open source](https://www.terraform.io/) and includes automatation tests and examples. It also helps to create and improve your infrastructure with minimalistic code instead of maintaining the whole infrastructure code yourself.

We have [*fifty plus terraform modules*][terraform_modules]. A few of them are comepleted and are available for open source usage while a few others are in progress.




## Prerequisites

This module has a few dependencies: 

- [Terraform 1.x.x](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Go](https://golang.org/doc/install)
- [github.com/stretchr/testify/assert](https://github.com/stretchr/testify)
- [github.com/gruntwork-io/terratest/modules/terraform](https://github.com/gruntwork-io/terratest)







## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/clouddrove/terraform-aws-secrets-manager/releases).


Here is examples of how you can use this module in your inventory structure:
### Binary Example
```hcl
  module "secrets_manager" {

  source      = "clouddrove/secrets_manager/aws"
  version     = "1.3.0"
  name        = "secrets-manager"
  environment = "test"
  label_order = ["name", "environment"]

  secrets = [
  {
  name          = "secret-binary-1"
  description   = "This is a binary secret"
  secret_binary = "ssh-rsa /+ZHJ4gx0gB8yQ/JWPhG1Xi2AWrMqfkidHOh5cp/H+/vSgD47xHID0JqOOugkN96fBY4/PbvoI6UfPFDGQxfE7LaqGsPf2QZcEJlYxK3f+io/uHDKrq6Q5KnZw2+DdsBxuDfM1BlJqoWRfmcB9wKPWBvm9xMUVm8T2BIcwWikgNuzssy6p63ab7HOzCyl4i7y8V4v8ouIHDM5QA29oVLHz40Nc0JS6ahVQta4JEOHUTf3hgvw9vCAWyyjlJScLSPyQtLXTuBh2FbtG9YouiDv1SszFHStYPvWdq+6CQY5bWfzqyVXZ9lqQhHUkOaW0FJbGGfBMmwQ5WO15925OF53YgtltwSBb9SIF4k9fHjDJ9YUr4bSiIB6oDwoJmWGjS9eI8pxdTAgJ4+IXj+F/Q+AxtDiRsSUKRp2EhIoxxpy+xXMZjGyMDCSLtntzu8yF3SMiZewpR7dWZ8PzDWY7hei3M6kH6BNAy0SX9GRbT3JwGar3OilqZOoCfjjDcakgFDc1vcZnHwBarXnXP520D1hXxP+TCiemAhcFugp7FHAQdhs4+cYk3hJexpU3+SQxizoSkmd7JszO5YlJUtd9k93Q4wWnTk4rmukIJWFsGX8R9Uhb14J0mWDZAvuldnpaO3ASInl2o7r8CvQGcAavnAhBOWHs6AoSUX4ZMG0pk41sM7r7EgKsPG2J5aCpnI9Ht1od7UGaCBtcQv2yZVWrGT1yRJVwGi5Fk+IemFqbIzd5I1HldZvouvQ7Qy5Ezba2y8aYbKY9bvA4nqcCH9eA38671+Ykho/3LpZ5tLt120XGnBfMhMqNtHewzhtdv4y39iEFa+AFa5MXxx7uJe5EcoT/z3WXGIWaC9oIOLpedhsrDyKOvrzwcQ3r+PF6cZuskAaM0j/DgAVmwFke0Iqz2Blq6BnDBmTzXS5yOqr2jebNbFQq3btM6m5zUYTRFkJ/fYBL8nujkPJtE2b1PFIPKX2SDMhIlLcH9SKxlAOxzmF7xu0LsAQENtSawcm3rIZzuBJsV2IlaBuAPP2c01k6upc6VXoMScWZ3a/RZTfmRLPiumkrsmL5xTyK8P4qohUGzPAXWz8Aq0GrHjbu7MPveXiVstFBhtVzeq5G4O2A+BqIu9Paq/lKF9AhQEaM6Ipjo8fTQ1yJIjjj6mCyL51b1cLd7NsKh50WCJBYArhV+5uUTxw9Qih+nvITHoF7q8lNfigVMaACbWqHpE0kMGPqNXhXhtXPhTkMoc4BPBS4aBaVdFqrp6cxGwVsfHOrsk8L1gzuOu8ovjgBfNdcdHGFB4D9joJ test-ssh-key"
  },
  {
  name                    = "secret-binary-2"
  description             = "Another binary secret"
  secret_binary           = "ssh-rsa /+ZHJ4gx0gB8yQ/JWPhG1Xi2AWrMqfkidHOh5cp/H+/vSgD47xHID0JqOOugkN96fBY4/PbvoI6UfPFDGQxfE7LaqGsPf2QZcEJlYxK3f+io/uHDKrq6Q5KnZw2+DdsBxuDfM1BlJqoWRfmcB9wKPWBvm9xMUVm8T2BIcwWikgNuzssy6p63ab7HOzCyl4i7y8V4v8ouIHDM5QA29oVLHz40Nc0JS6ahVQta4JEOHUTf3hgvw9vCAWyyjlJScLSPyQtLXTuBh2FbtG9YouiDv1SszFHStYPvWdq+6CQY5bWfzqyVXZ9lqQhHUkOaW0FJbGGfBMmwQ5WO15925OF53YgtltwSBb9SIF4k9fHjDJ9YUr4bSiIB6oDwoJmWGjS9eI8pxdTAgJ4+IXj+F/Q+AxtDiRsSUKRp2EhIoxxpy+xXMZjGyMDCSLtntzu8yF3SMiZewpR7dWZ8PzDWY7hei3M6kH6BNAy0SX9GRbT3JwGar3OilqZOoCfjjDcakgFDc1vcZnHwBarXnXP520D1hXxP+TCiemAhcFugp7FHAQdhs4+cYk3hJexpU3+SQxizoSkmd7JszO5YlJUtd9k93Q4wWnTk4rmukIJWFsGX8R9Uhb14J0mWDZAvuldnpaO3ASInl2o7r8CvQGcAavnAhBOWHs6AoSUX4ZMG0pk41sM7r7EgKsPG2J5aCpnI9Ht1od7UGaCBtcQv2yZVWrGT1yRJVwGi5Fk+IemFqbIzd5I1HldZvouvQ7Qy5Ezba2y8aYbKY9bvA4nqcCH9eA38671+Ykho/3LpZ5tLt120XGnBfMhMqNtHewzhtdv4y39iEFa+AFa5MXxx7uJe5EcoT/z3WXGIWaC9oIOLpedhsrDyKOvrzwcQ3r+PF6cZuskAaM0j/DgAVmwFke0Iqz2Blq6BnDBmTzXS5yOqr2jebNbFQq3btM6m5zUYTRFkJ/fYBL8nujkPJtE2b1PFIPKX2SDMhIlLcH9SKxlAOxzmF7xu0LsAQENtSawcm3rIZzuBJsV2IlaBuAPP2c01k6upc6VXoMScWZ3a/RZTfmRLPiumkrsmL5xTyK8P4qohUGzPAXWz8Aq0GrHjbu7MPveXiVstFBhtVzeq5G4O2A+BqIu9Paq/lKF9AhQEaM6Ipjo8fTQ1yJIjjj6mCyL51b1cLd7NsKh50WCJBYArhV+5uUTxw9Qih+nvITHoF7q8lNfigVMaACbWqHpE0kMGPqNXhXhtXPhTkMoc4BPBS4aBaVdFqrp6cxGwVsfHOrsk8L1gzuOu8ovjgBfNdcdHGFB4D9joJ test-ssh-key-2"
  recovery_window_in_days = 7
    }
     ]
  }
```

### Key-value
```hcl
   module "secrets_manager" {

  source      = "clouddrove/secrets_manager/aws"
  version     = "1.3.0"
  name        = "secrets-manager"
  environment = "test"
  label_order = ["name", "environment"]

  secrets = [
  {
  name        = "secret-kv-1"
  description = "This is a key/value secret"

  secret_key_value = {
  key1  = "value1"
  key2  = "value2"
  key3  = "value2"
  key4  = "value2"
  key5  = "value2"
  key6  = "value2"
  key7  = "value2"
  key8  = "value2"
  key89 = "value2"

}
  recovery_window_in_days = 7
  },
  {
  name        = "secret-kv-2"
  description = "Another key/value secret"

  secret_key_value = {
  username = "user"
  password = "topsecret"
  }
  recovery_window_in_days = 7
  },
  ]



}
```

### plaintext
```hcl
  module "secrets_manager" {

  source      = "clouddrove/secrets_manager/aws"
  version   = "1.3.0"
  name        = "secrets-manager"
  environment = "test"
  label_order = ["name", "environment"]

  secrets = [
  {
  name                    = "secret-1"
  description             = "My secret 1"
  recovery_window_in_days = 7
  secret_string           = "This is an example"
  },
  {
  name                    = "secret-2"
  description             = "My secret 2"
  recovery_window_in_days = 7
  secret_string           = "This is another example"
  }
  ]
}
```






## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`). | `list(any)` | `[]` | no |
| automatically\_after\_days | Specifies the number of days between automatic scheduled rotations of the secret. | `number` | `30` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| label\_order | Label order, e.g. `name`. | `list(any)` | `[]` | no |
| managedby | ManagedBy, eg 'CloudDrove' | `string` | `"hello@clouddrove.com"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| recovery\_window\_in\_days | Specifies the number of days that AWS Secrets Manager waits before it can delete the secret. This value can be 0 to force deletion without recovery or range from 7 to 30 days. | `number` | `30` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/clouddrove/terraform-aws-secrets-manager"` | no |
| rotate\_secrets | List of secrets to keep and rotate in AWS Secrets Manager | `any` | `[]` | no |
| secrets | List of secrets to keep in AWS Secrets Manager | `any` | `[]` | no |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`). | `map(any)` | `{}` | no |
| unmanaged | Terraform must ignore secrets lifecycle. Using this option you can initialize the secrets and rotate them outside Terraform, thus, avoiding other users to change or rotate the secrets by subsequent runs of Terraform | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| secret\_arns | Secret arn list |
| secret\_ids | Secret id list |
| version\_id | The unique identifier of the version of the secret. |




## Testing
In this module testing is performed with [terratest](https://github.com/gruntwork-io/terratest) and it creates a small piece of infrastructure, matches the output like ARN, ID and Tags name etc and destroy infrastructure in your AWS account. This testing is written in GO, so you need a [GO environment](https://golang.org/doc/install) in your system. 

You need to run the following command in the testing folder:
```hcl
  go test -run Test
```



## Feedback 
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/clouddrove/terraform-aws-secrets-manager/issues), or feel free to drop us an email at [hello@clouddrove.com](mailto:hello@clouddrove.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/clouddrove/terraform-aws-secrets-manager)!

## About us

At [CloudDrove][website], we offer expert guidance, implementation support and services to help organisations accelerate their journey to the cloud. Our services include docker and container orchestration, cloud migration and adoption, infrastructure automation, application modernisation and remediation, and performance engineering.

<p align="center">We are <b> The Cloud Experts!</b></p>
<hr />
<p align="center">We ❤️  <a href="https://github.com/clouddrove">Open Source</a> and you can check out <a href="https://github.com/clouddrove">our other modules</a> to get help with your new Cloud ideas.</p>

  [website]: https://clouddrove.com
  [github]: https://github.com/clouddrove
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://twitter.com/clouddrove/
  [email]: https://clouddrove.com/contact-us.html
  [terraform_modules]: https://github.com/clouddrove?utf8=%E2%9C%93&q=terraform-&type=&language=
