---
name: ✨ Feature Request
about: Suggest a new Terraform example or improvement
title: '[FEATURE] '
labels: ['enhancement']
assignees: ''
---

## 🎯 Feature Description
A clear and concise description of the new example or feature you'd like to see.

## 📚 Learning Objective
What Terraform or AWS concept would this help teach?

## 🏗️ Proposed Example Structure
What would this example demonstrate? (e.g., new AWS service, Terraform feature, etc.)

## 📁 Suggested Folder Name
What should the new example folder be called?
- [ ] 03-aws-[service-name]
- [ ] 04-terraform-[feature]
- [ ] Other: ___________

## 🎓 Difficulty Level
- [ ] Beginner (builds on 00-local-file-example)
- [ ] Intermediate (builds on EC2/S3 concepts)
- [ ] Advanced (complex multi-service setup)

## 🔗 Related Resources
Any AWS documentation, Terraform guides, or examples that might be helpful:

## 💰 Cost Considerations
Will this example create AWS resources that incur costs?
- [ ] Free tier eligible
- [ ] Low cost (< $1/day)
- [ ] Medium cost ($1-10/day)
- [ ] High cost (> $10/day)
- [ ] No AWS resources (local only)

## 📋 Example Outline
What files and resources should be included?

```
XX-example-name/
├── main.tf          # [describe main resources]
├── variables.tf     # [key variables needed]
├── outputs.tf       # [useful outputs]
├── provider.tf      # [provider requirements]
├── README.md        # [learning guide]
└── [other files]    # [additional files needed]
```

## ✅ I can help with
- [ ] Writing the Terraform code
- [ ] Creating documentation
- [ ] Testing the example
- [ ] Reviewing pull requests
